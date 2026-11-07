import 'dart:async';

import 'package:camera/camera.dart';
import 'package:camera_platform_interface/camera_platform_interface.dart';
import 'package:camera_platform_interface/src/method_channel/method_channel_camera.dart';
import 'package:fest_outdoor/widgets/camera_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

class _StreamingCamera extends MethodChannelCamera {
  @override
  bool supportsImageStreaming() => true;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('plugins.flutter.io/camera');
  const streamChannel = MethodChannel('plugins.flutter.io/camera/imageStream');
  const codec = StandardMethodCodec();
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  late CameraPlatform originalPlatform;

  Future<void> sendFrame({int format = 17, int planeCount = 1}) async {
    await messenger.handlePlatformMessage(
      streamChannel.name,
      codec.encodeSuccessEnvelope({
        'width': 4,
        'height': 2,
        'format': format,
        'planes': [
          for (var i = 0; i < planeCount; i++)
            {
              'bytes': Uint8List.fromList(List.generate(12, (index) => index)),
              'bytesPerRow': 4,
              'bytesPerPixel': 1,
              'width': 4,
              'height': 2,
            },
        ],
      }),
      (_) {},
    );
  }

  setUp(() {
    originalPlatform = CameraPlatform.instance;
    CameraPlatform.instance = _StreamingCamera();
    messenger.setMockMethodCallHandler(streamChannel, (_) async => null);
    messenger.setMockMethodCallHandler(channel, (call) async {
      switch (call.method) {
        case 'availableCameras':
          return [
            {'name': 'back', 'lensFacing': 'back', 'sensorOrientation': 90},
          ];
        case 'create':
          return {'cameraId': 0};
        case 'initialize':
          expect(call.arguments['imageFormatGroup'], 'nv21');
          await messenger.handlePlatformMessage(
            'flutter.io/cameraPlugin/camera0',
            codec.encodeMethodCall(
              const MethodCall('initialized', {
                'previewWidth': 1280.0,
                'previewHeight': 720.0,
                'exposureMode': 'auto',
                'focusMode': 'auto',
                'exposurePointSupported': true,
                'focusPointSupported': true,
              }),
            ),
            (_) {},
          );
          return null;
        case 'getMinZoomLevel':
          return 1.0;
        case 'getMaxZoomLevel':
          return 4.0;
        default:
          return null;
      }
    });
  });

  tearDown(() {
    CameraPlatform.instance = originalPlatform;
    messenger.setMockMethodCallHandler(channel, null);
    messenger.setMockMethodCallHandler(streamChannel, null);
  });

  testWidgets('preview fills the viewport without distorting portrait frames', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 360,
              height: 480,
              child: CameraView(customPaint: null, onImage: (_) async {}),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final preview = find.byType(CameraPreview);
    final cover = find.ancestor(of: preview, matching: find.byType(FittedBox));
    expect(tester.widget<FittedBox>(cover).fit, BoxFit.cover);
    final size = tester.getSize(preview);
    expect(size.width, greaterThanOrEqualTo(360));
    expect(size.height, greaterThanOrEqualTo(480));
    expect(size.width / size.height, closeTo(720 / 1280, 0.001));
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
    await tester.pumpAndSettle();
  }, variant: TargetPlatformVariant.only(TargetPlatform.android));

  testWidgets('NV21 frames are processed one at a time with correct metadata', (
    tester,
  ) async {
    final frames = <InputImage>[];
    final completion = Completer<void>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CameraView(
            customPaint: null,
            onImage: (image) async {
              frames.add(image);
              await completion.future;
            },
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await sendFrame();
    await tester.pump();
    expect(frames, hasLength(1));
    expect(frames.single.bytes, orderedEquals(List.generate(12, (i) => i)));
    expect(frames.single.metadata!.format, InputImageFormat.nv21);
    expect(frames.single.metadata!.rotation, InputImageRotation.rotation90deg);
    expect(frames.single.metadata!.size, const Size(4, 2));
    expect(frames.single.metadata!.bytesPerRow, 4);
    await sendFrame();
    await tester.pump();
    expect(frames, hasLength(1));
    completion.complete();
    await tester.pump();
    await sendFrame();
    await tester.pump();
    expect(frames, hasLength(2));
    await sendFrame(format: 35, planeCount: 3);
    await sendFrame(planeCount: 0);
    await tester.pump();
    expect(frames, hasLength(2));
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
    await tester.pumpAndSettle();
  }, variant: TargetPlatformVariant.only(TargetPlatform.android));
}

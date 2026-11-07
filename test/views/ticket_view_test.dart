import 'dart:async';

import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:fest_outdoor/views/ticket_view.dart';
import 'package:fest_outdoor/widgets/camera_view.dart';
import 'package:fest_outdoor/widgets/code_manually_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget app(Widget home, {Locale locale = const Locale('cs')}) => MaterialApp(
    theme: AppTheme.light,
    locale: locale,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: home,
  );

  testWidgets(
    'scanner opens and cancels manual entry without decoding frames',
    (tester) async {
      const camera = MethodChannel('plugins.flutter.io/camera');
      const barcode = MethodChannel('google_mlkit_barcode_scanning');
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      var decodedFrames = 0;
      messenger.setMockMethodCallHandler(camera, (_) async => []);
      messenger.setMockMethodCallHandler(barcode, (call) async {
        if (call.method == 'vision#startBarcodeScanner') decodedFrames++;
        return [];
      });
      addTearDown(() {
        messenger.setMockMethodCallHandler(camera, null);
        messenger.setMockMethodCallHandler(barcode, null);
      });
      tester.view.physicalSize = const Size(320, 800);
      tester.view.devicePixelRatio = 1;
      tester.view.padding = const FakeViewPadding(top: 32);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.view.resetPadding);

      await tester.pumpWidget(app(const TicketView()));
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('Kontrola vstupenek'), findsOneWidget);
      expect(find.text('Namířte kameru na QR kód na lístku'), findsOneWidget);
      expect(find.byType(TextFormField), findsNothing);
      expect(tester.getSize(find.byType(CameraView)).width, 304);
      expect(
        tester.getSize(find.byType(CameraView)).height,
        closeTo(405.3, 0.1),
      );
      expect(
        tester.getTopLeft(find.byTooltip('Zpět')).dy,
        greaterThanOrEqualTo(32),
      );
      final frame = find.descendant(
        of: find.byType(AspectRatio),
        matching: find.byType(CustomPaint),
      );
      final initialPainter = tester.widget<CustomPaint>(frame).painter!;
      expect(tester.getSize(frame).width, closeTo(273.6, 0.1));
      await tester.pump(const Duration(milliseconds: 600));
      expect(
        tester
            .widget<CustomPaint>(frame)
            .painter!
            .shouldRepaint(initialPainter),
        isTrue,
      );

      final feed = tester.widget<CameraView>(find.byType(CameraView));
      feed.onImage(InputImage.fromFilePath('unused'));
      await tester.pump();
      expect(decodedFrames, 1);

      await tester.tap(find.text('Ručně zadat kód'));
      await tester.pumpAndSettle();
      expect(find.text('Zadejte kód z lístku ručně'), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      final pausedPainter = tester.widget<CustomPaint>(frame).painter!;
      await tester.pump(const Duration(seconds: 1));
      expect(
        tester.widget<CustomPaint>(frame).painter!.shouldRepaint(pausedPainter),
        isFalse,
      );
      feed.onImage(InputImage.fromFilePath('unused'));
      await tester.pump();
      expect(decodedFrames, 1);
      await tester.enterText(find.byType(TextFormField), '36K7M7KN');
      await tester.ensureVisible(find.text('Zrušit'));
      await tester.tap(find.text('Zrušit'));
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.byType(TextFormField), findsNothing);
      await tester.tap(find.text('Ručně zadat kód'));
      await tester.pumpAndSettle();
      expect(
        tester
            .widget<TextFormField>(find.byType(TextFormField))
            .controller!
            .text,
        isEmpty,
      );
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
      await tester.pump();
    },
  );

  testWidgets('manual entry trims codes and prevents duplicate submissions', (
    tester,
  ) async {
    final completion = Completer<void>();
    final codes = <String>[];
    await tester.pumpWidget(
      app(
        Scaffold(
          body: CodeManuallyForm(
            onCancel: () {},
            onSubmit: (code) {
              codes.add(code);
              return completion.future;
            },
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNull,
    );
    await tester.enterText(find.byType(TextFormField), '   ');
    await tester.pump();
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNull,
    );
    await tester.enterText(find.byType(TextFormField), '  Ticket-Code  ');
    await tester.pump();
    await tester.tap(find.text('Zkontrolovat'));
    await tester.pump();
    expect(codes, ['Ticket-Code']);
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNull,
    );
    expect(
      tester.widget<OutlinedButton>(find.byType(OutlinedButton)).onPressed,
      isNull,
    );
    completion.complete();
    await tester.pumpAndSettle();
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNotNull,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('Polish manual entry fits a narrow screen with enlarged text', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 480);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      app(
        MediaQuery(
          data: const MediaQueryData(textScaler: TextScaler.linear(2)),
          child: Scaffold(
            body: SingleChildScrollView(
              child: CodeManuallyForm(onCancel: () {}, onSubmit: (_) async {}),
            ),
          ),
        ),
        locale: const Locale('pl'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Kod biletu'), findsOneWidget);
    await tester.ensureVisible(find.text('Sprawdź'));
    expect(find.text('Sprawdź').hitTestable(), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

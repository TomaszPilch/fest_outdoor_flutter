import 'package:camera/camera.dart';
import 'package:fest_outdoor/localization/app_localizations.dart';
import 'package:fest_outdoor/views/ticket_detail.dart';
import 'package:fest_outdoor/widgets/camera_view.dart';
import 'package:fest_outdoor/widgets/code_manually_form.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  final BarcodeScanner _barcodeScanner =
      BarcodeScanner(formats: [BarcodeFormat.qrCode]);
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  var _cameraLensDirection = CameraLensDirection.back;

  @override
  void dispose() {
    _canProcess = false;
    _barcodeScanner.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          localizations.tickets,
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 400,
            width: 400,
            child: CameraView(
              customPaint: _customPaint,
              onImage: (InputImage inputImage) {
                _processImage(inputImage, context);
              },
              initialCameraLensDirection: _cameraLensDirection,
              onCameraLensDirectionChanged: (value) =>
                  _cameraLensDirection = value,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CodeManuallyForm(),
        ],
      ),
    );
  }

  Future<void> _processImage(
      InputImage inputImage, BuildContext context) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;

    try {
      final barcodes = await _barcodeScanner.processImage(inputImage);
      if (barcodes.isNotEmpty) {
        final barcode = barcodes[0];

        if (!context.mounted) {
          return;
        }

        await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TicketDetail(
                  code: barcode.rawValue.toString(),
                )));
      }
      _isBusy = false;
    } catch (e) {
      _isBusy = false;
    }
  }
}

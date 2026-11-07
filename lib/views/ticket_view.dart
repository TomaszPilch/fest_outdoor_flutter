import 'package:camera/camera.dart';
import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
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

class _TicketViewState extends State<TicketView>
    with SingleTickerProviderStateMixin {
  final BarcodeScanner _barcodeScanner = BarcodeScanner(
    formats: [BarcodeFormat.qrCode],
  );
  bool _canProcess = true;
  bool _isBusy = false;
  bool _manual = false;
  bool _showingTicket = false;
  var _cameraLensDirection = CameraLensDirection.back;
  late final AnimationController _scanAnimation;

  @override
  void initState() {
    super.initState();
    _scanAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateScanAnimation();
  }

  void _updateScanAnimation() {
    if (_manual || _showingTicket || MediaQuery.disableAnimationsOf(context)) {
      _scanAnimation.stop();
    } else {
      _scanAnimation.repeat(reverse: true);
    }
  }

  void _setManual(bool value) {
    setState(() => _manual = value);
    _updateScanAnimation();
  }

  @override
  void dispose() {
    _canProcess = false;
    _scanAnimation.dispose();
    _barcodeScanner.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final colors = AppThemeColors.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: colors.header,
      body: AnnotatedRegion(
        value: AppTheme.headerOverlayStyle,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: AppTheme.contentMaxWidth,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(AppSpacing.lg),
                            child: Row(
                              children: [
                                IconButton.filledTonal(
                                  tooltip: MaterialLocalizations.of(
                                    context,
                                  ).backButtonTooltip,
                                  style: IconButton.styleFrom(
                                    backgroundColor: colors.onHeader.withValues(
                                      alpha: 0.15,
                                    ),
                                    foregroundColor: colors.onHeader,
                                  ),
                                  onPressed: () =>
                                      Navigator.of(context).maybePop(),
                                  icon: const Icon(Icons.arrow_back, size: 20),
                                ),
                                const SizedBox(width: AppSpacing.md),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        localizations.goToTicketView,
                                        style: theme.textTheme.titleLarge!
                                            .copyWith(color: colors.onHeader),
                                      ),
                                      Text(
                                        localizations.ticketScanSubtitle,
                                        style: theme.textTheme.bodySmall!
                                            .copyWith(
                                              color: colors.onHeader.withValues(
                                                alpha: 0.6,
                                              ),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.xl,
                                vertical: AppSpacing.lg,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 336,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        AppRadii.xl,
                                      ),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          CameraView(
                                            customPaint: null,
                                            onImage: _processImage,
                                            initialCameraLensDirection:
                                                _cameraLensDirection,
                                            onCameraLensDirectionChanged:
                                                (value) =>
                                                    _cameraLensDirection =
                                                        value,
                                          ),
                                          Center(
                                            child: ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                maxWidth: 256,
                                              ),
                                              child: AspectRatio(
                                                aspectRatio: 1,
                                                child: IgnorePointer(
                                                  child: AnimatedBuilder(
                                                    animation: _scanAnimation,
                                                    builder: (context, child) => CustomPaint(
                                                      painter: _ScanFramePainter(
                                                        color:
                                                            colors.heroAccent,
                                                        scanPosition:
                                                            MediaQuery.disableAnimationsOf(
                                                              context,
                                                            )
                                                            ? 0.5
                                                            : Curves.easeInOut
                                                                  .transform(
                                                                    _scanAnimation
                                                                        .value,
                                                                  ),
                                                        scanning:
                                                            !_manual &&
                                                            !_showingTicket,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.xxl),
                                  Text(
                                    _manual
                                        ? localizations.ticketManualHint
                                        : localizations.ticketScanHint,
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: colors.onHeader.withValues(
                                        alpha: 0.6,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(AppSpacing.lg),
                            child: _manual
                                ? CodeManuallyForm(
                                    onSubmit: _openTicket,
                                    onCancel: () => _setManual(false),
                                  )
                                : OutlinedButton.icon(
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: colors.onHeader,
                                      backgroundColor: colors.onHeader
                                          .withValues(alpha: 0.1),
                                      side: BorderSide(
                                        color: colors.onHeader.withValues(
                                          alpha: 0.25,
                                        ),
                                      ),
                                      minimumSize: const Size.fromHeight(48),
                                    ),
                                    onPressed: () => _setManual(true),
                                    icon: const Icon(
                                      Icons.keyboard_outlined,
                                      size: 20,
                                    ),
                                    label: Text(localizations.codeManually),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openTicket(String code) async {
    if (!mounted || _showingTicket) return;
    FocusScope.of(context).unfocus();
    setState(() => _showingTicket = true);
    _updateScanAnimation();
    try {
      await Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => TicketDetail(code: code)));
    } finally {
      if (mounted) {
        setState(() {
          _showingTicket = false;
          _manual = false;
        });
        _updateScanAnimation();
      }
    }
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess || _isBusy || _manual || _showingTicket) return;
    _isBusy = true;

    try {
      final barcodes = await _barcodeScanner.processImage(inputImage);
      if (!_canProcess || !mounted || _manual || _showingTicket) return;
      for (final barcode in barcodes) {
        final code = barcode.rawValue;
        if (code == null || code.trim().isEmpty) continue;
        await _openTicket(code);
        break;
      }
    } catch (_) {
      // Keep scanning when a camera frame cannot be decoded.
    } finally {
      _isBusy = false;
    }
  }
}

class _ScanFramePainter extends CustomPainter {
  const _ScanFramePainter({
    required this.color,
    required this.scanPosition,
    required this.scanning,
  });

  final Color color;
  final double scanPosition;
  final bool scanning;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    final corner = Path()
      ..moveTo(2, 32)
      ..lineTo(2, 14)
      ..quadraticBezierTo(2, 2, 14, 2)
      ..lineTo(32, 2);
    canvas.drawPath(corner, paint);
    canvas.save();
    canvas.translate(size.width, 0);
    canvas.scale(-1, 1);
    canvas.drawPath(corner, paint);
    canvas.restore();
    canvas.save();
    canvas.translate(0, size.height);
    canvas.scale(1, -1);
    canvas.drawPath(corner, paint);
    canvas.translate(size.width, 0);
    canvas.scale(-1, 1);
    canvas.drawPath(corner, paint);
    canvas.restore();
    if (scanning) {
      final y = 12 + (size.height - 24) * scanPosition;
      canvas.drawLine(Offset(12, y), Offset(size.width - 12, y), paint);
    }
  }

  @override
  bool shouldRepaint(_ScanFramePainter oldDelegate) =>
      color != oldDelegate.color ||
      scanPosition != oldDelegate.scanPosition ||
      scanning != oldDelegate.scanning;
}

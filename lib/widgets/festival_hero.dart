import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:fest_outdoor/utils/general.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class FestivalHero extends StatelessWidget {
  const FestivalHero({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = AppThemeColors.of(context);
    final topInset = MediaQuery.paddingOf(context).top;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final town = AppLocalizations.of(context)!.festivalTown;
    final first = conferenceDays.first;
    final last = conferenceDays.last;
    final sameMonth = first.year == last.year && first.month == last.month;
    final dates = sameMonth
        ? '${DateFormat('d', locale).format(first)}'
              '\u2013${DateFormat('d MMMM yyyy', locale).format(last)}'
        : '${DateFormat('d MMMM yyyy', locale).format(first)}'
              '\u2013${DateFormat('d MMMM yyyy', locale).format(last)}';

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.headerOverlayStyle,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/festival_hero.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(gradient: colors.heroOverlay),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 288 + topInset),
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.xl,
                  48 + topInset,
                  AppSpacing.xl,
                  48,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                        vertical: AppSpacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: colors.heroForeground.withValues(alpha: 0.1),
                        border: Border.all(
                          color: colors.heroForeground.withValues(alpha: 0.4),
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        '$dates \u2022 $town'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: theme.textTheme.labelSmall!.copyWith(
                          color: colors.heroForeground,
                          letterSpacing: 1.65,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      'FEST',
                      style: theme.textTheme.displayLarge!.copyWith(
                        color: colors.heroForeground,
                      ),
                    ),
                    Text(
                      'Outdoor',
                      style: theme.textTheme.displayMedium!.copyWith(
                        color: colors.heroAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 30,
            child: CustomPaint(
              painter: _HeroCurvePainter(theme.scaffoldBackgroundColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroCurvePainter extends CustomPainter {
  final Color color;

  const _HeroCurvePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(size.width / 2, 0, size.width, size.height)
      ..close();
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(_HeroCurvePainter oldDelegate) =>
      color != oldDelegate.color;
}

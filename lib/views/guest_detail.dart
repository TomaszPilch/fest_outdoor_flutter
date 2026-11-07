import 'package:fest_outdoor/models/guest.dart';
import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/widgets/content_block.dart';
import 'package:fest_outdoor/widgets/guest_detail_hero.dart';
import 'package:fest_outdoor/widgets/guest_detail_time_favorite.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GuestDetail extends StatelessWidget {
  final Guest guest;

  const GuestDetail({super.key, required this.guest});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = AppThemeColors.of(context);
    final topInset = MediaQuery.paddingOf(context).top;
    final title = guest.title.trim().isEmpty
        ? AppLocalizations.of(context)!.guestTitleUnavailable
        : guest.title;
    final hasName = guest.name.trim().isNotEmpty;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 112 + topInset,
                  child: AnnotatedRegion<SystemUiOverlayStyle>(
                    value: AppTheme.headerOverlayStyle,
                    child: ColoredBox(color: colors.header),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    AppSpacing.xl,
                    48 + topInset,
                    AppSpacing.xl,
                    0,
                  ),
                  child: Column(
                    children: [
                      GuestDetailHero(guest: guest),
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        hasName ? guest.name : title,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineMedium,
                      ),
                      if (hasName && guest.title.trim().isNotEmpty) ...[
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          '\u201e${guest.title}\u201d',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                      const SizedBox(height: AppSpacing.xl),
                      GuestDetailTimeFavorite(guest: guest),
                    ],
                  ),
                ),
                Positioned(
                  top: AppSpacing.sm + topInset,
                  left: AppSpacing.sm,
                  child: TextButton.icon(
                    onPressed: () => Navigator.of(context).maybePop(),
                    icon: const Icon(Icons.arrow_back, size: 20),
                    label: Text(AppLocalizations.of(context)!.program),
                    style: TextButton.styleFrom(
                      foregroundColor: colors.onHeader,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.sm,
                AppSpacing.xl,
                AppSpacing.sm,
                AppSpacing.xl,
              ),
              child: DefaultTextStyle.merge(
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.85),
                  height: 1.625,
                ),
                child: ContentBlock(content: guest.content),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

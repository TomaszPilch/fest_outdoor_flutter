import 'package:fest_outdoor/models/guest.dart';
import 'package:fest_outdoor/providers/guests_favorites_provider.dart';
import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class GuestDetailTimeFavorite extends StatelessWidget {
  final Guest guest;

  const GuestDetailTimeFavorite({super.key, required this.guest});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final date = DateFormat(
      'EEEE d. M.',
      Localizations.localeOf(context).toLanguageTag(),
    ).format(guest.start.toLocal());

    Widget detail(IconData icon, String text, {bool alignRight = false}) => Row(
      mainAxisAlignment: alignRight
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: scheme.primary),
        const SizedBox(width: AppSpacing.sm),
        Flexible(
          child: Text(
            text,
            textAlign: alignRight ? TextAlign.right : TextAlign.left,
            style: theme.textTheme.labelLarge,
          ),
        ),
      ],
    );

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            Expanded(child: detail(Icons.calendar_today_outlined, date)),
            const SizedBox(width: AppSpacing.sm),
            Consumer(
              builder: (context, ref, child) {
                final favorites = ref.watch(guestsFavoritesProvider);
                return switch (favorites) {
                  AsyncData(value: final values) => IconButton(
                    onPressed: () => ref
                        .read(guestsFavoritesProvider.notifier)
                        .toggleFavorite(guest.id),
                    tooltip: values.contains(guest.id)
                        ? l10n.removeFromFavorites
                        : l10n.addToFavorites,
                    isSelected: values.contains(guest.id),
                    icon: const Icon(Icons.favorite_border_outlined, size: 20),
                    selectedIcon: const Icon(Icons.favorite, size: 20),
                    style: IconButton.styleFrom(
                      backgroundColor: values.contains(guest.id)
                          ? scheme.primary
                          : scheme.surface,
                      foregroundColor: values.contains(guest.id)
                          ? scheme.onPrimary
                          : scheme.onSurfaceVariant,
                      side: BorderSide(
                        color: values.contains(guest.id)
                            ? scheme.primary
                            : scheme.outline,
                      ),
                      shape: const CircleBorder(),
                    ),
                  ),
                  _ => const SizedBox(
                    width: 48,
                    height: 48,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                };
              },
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: detail(
                Icons.schedule_outlined,
                guest.startEnd,
                alignRight: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

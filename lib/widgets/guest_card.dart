import 'package:fest_outdoor/models/guest.dart';
import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:flutter/material.dart';

class GuestCard extends StatelessWidget {
  final Guest guest;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;

  const GuestCard({
    super.key,
    required this.guest,
    required this.isFavorite,
    required this.onTap,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final title = guest.title.trim().isEmpty
        ? l10n.guestTitleUnavailable
        : guest.title;
    final name = guest.name.trim().isEmpty ? guest.title : guest.name;
    final initials = name.trim().isEmpty
        ? '?'
        : name
              .trim()
              .split(RegExp(r'\s+'))
              .take(2)
              .map((word) => word.characters.first)
              .join()
              .toUpperCase();

    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'guest_photo_${guest.id}',
                    child: Container(
                      padding: const EdgeInsets.all(AppSpacing.xs),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: scheme.surface,
                      ),
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: scheme.secondary,
                        foregroundColor: scheme.primary,
                        backgroundImage: guest.image == null
                            ? null
                            : NetworkImage(
                                'https://cms-new.pzkogrodek.cz${guest.image!.url}',
                              ),
                        child: guest.image == null
                            ? Text(
                                initials,
                                style: theme.textTheme.titleMedium!.copyWith(
                                  color: scheme.primary,
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: scheme.primaryContainer,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            guest.startEnd,
                            style: theme.textTheme.labelMedium!.copyWith(
                              color: scheme.onPrimaryContainer,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          guest.name.trim().isEmpty ? title : guest.name,
                          style: theme.textTheme.titleMedium,
                        ),
                        if (guest.name.trim().isNotEmpty &&
                            guest.title.trim().isNotEmpty) ...[
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            '\u201e${guest.title}\u201d',
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: scheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  IconButton(
                    onPressed: onToggleFavorite,
                    tooltip: isFavorite
                        ? l10n.removeFromFavorites
                        : l10n.addToFavorites,
                    isSelected: isFavorite,
                    icon: const Icon(Icons.favorite_border_outlined, size: 20),
                    selectedIcon: const Icon(Icons.favorite, size: 20),
                    style: IconButton.styleFrom(
                      backgroundColor: isFavorite
                          ? scheme.primary
                          : scheme.surface,
                      foregroundColor: isFavorite
                          ? scheme.onPrimary
                          : scheme.onSurfaceVariant,
                      side: BorderSide(
                        color: isFavorite ? scheme.primary : scheme.outline,
                      ),
                      shape: const CircleBorder(),
                    ),
                  ),
                ],
              ),
              if (guest.description.trim().isNotEmpty) ...[
                const SizedBox(height: AppSpacing.md),
                Text(
                  guest.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

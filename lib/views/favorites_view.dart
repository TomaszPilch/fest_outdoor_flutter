import 'package:fest_outdoor/models/guest.dart';
import 'package:fest_outdoor/providers/guests_favorites_provider.dart';
import 'package:fest_outdoor/providers/guests_provider.dart';
import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:fest_outdoor/utils/general.dart';
import 'package:fest_outdoor/views/guest_detail.dart';
import 'package:fest_outdoor/widgets/guest_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class FavoritesView extends ConsumerWidget {
  final VoidCallback onBrowseProgram;

  const FavoritesView({super.key, required this.onBrowseProgram});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = AppThemeColors.of(context);
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final language = Localizations.localeOf(context).languageCode;
    final favorites = ref.watch(guestsFavoritesProvider);
    final ids = favorites.asData?.value;
    final guests = ids != null && ids.isNotEmpty
        ? ref.watch(guestsProvider(language))
        : const AsyncData<List<Guest>>([]);

    Widget empty() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: theme.colorScheme.secondary,
            child: Icon(
              Icons.favorite_border_outlined,
              size: 28,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            l10n.noSavedFavorites,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          FilledButton(
            onPressed: onBrowseProgram,
            child: Text(l10n.browseProgram),
          ),
        ],
      ),
    );

    List<Widget> savedGuests(List<Guest> values) {
      final saved = values
          .where(
            (guest) => guest.title.trim().isNotEmpty && ids!.contains(guest.id),
          )
          .toList();
      final sections = <Widget>[];
      for (final day in conferenceDays) {
        final dayGuests = saved.where((guest) {
          final date = guest.start.toLocal();
          return date.year == day.year &&
              date.month == day.month &&
              date.day == day.day;
        }).toList()..sort((a, b) => a.start.compareTo(b.start));
        if (dayGuests.isEmpty) continue;
        final weekday = DateFormat('EEEE', locale).format(day);
        sections.add(
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Flexible(
                      child: Text(
                        '${weekday[0].toUpperCase()}${weekday.substring(1)}',
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      DateFormat('d. M.', locale).format(day),
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                const Divider(),
                for (final guest in dayGuests) ...[
                  const SizedBox(height: AppSpacing.md),
                  GuestCard(
                    guest: guest,
                    isFavorite: true,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => GuestDetail(guest: guest),
                      ),
                    ),
                    onToggleFavorite: () => ref
                        .read(guestsFavoritesProvider.notifier)
                        .toggleFavorite(guest.id),
                  ),
                ],
                const SizedBox(height: AppSpacing.md),
              ],
            ),
          ),
        );
      }
      return sections.isEmpty ? [empty()] : sections;
    }

    Widget error() => Column(
      children: [
        Text(l10n.unableToLoadFavorites),
        TextButton(
          onPressed: () {
            ref.invalidate(guestsFavoritesProvider);
            ref.invalidate(guestsProvider(language));
          },
          child: Text(l10n.retry),
        ),
      ],
    );

    final List<Widget> body = switch (favorites) {
      AsyncData() =>
        ids!.isEmpty
            ? [empty()]
            : switch (guests) {
                AsyncData(:final value) => savedGuests(value),
                AsyncError() => [error()],
                _ => [const Center(child: CircularProgressIndicator())],
              },
      AsyncError() => [error()],
      _ => [const Center(child: CircularProgressIndicator())],
    };

    return SafeArea(
      top: false,
      bottom: false,
      child: RefreshIndicator(
        onRefresh: () async {
          if (ids != null && ids.isNotEmpty) {
            await ref.refresh(guestsProvider(language).future);
          }
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            AnnotatedRegion<SystemUiOverlayStyle>(
              value: AppTheme.headerOverlayStyle,
              child: Container(
                color: colors.header,
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.xl,
                  40 + MediaQuery.paddingOf(context).top,
                  AppSpacing.xl,
                  AppSpacing.xxl,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.favorite,
                      style: theme.textTheme.headlineLarge!.copyWith(
                        color: colors.onHeader,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      l10n.personalFestivalProgram,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: colors.onHeader.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

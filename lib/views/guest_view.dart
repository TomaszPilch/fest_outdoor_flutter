import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/models/guest.dart';
import 'package:fest_outdoor/providers/guests_day_provider.dart';
import 'package:fest_outdoor/providers/guests_favorites_provider.dart';
import 'package:fest_outdoor/providers/guests_provider.dart';
import 'package:fest_outdoor/views/guest_detail.dart';
import 'package:fest_outdoor/widgets/empty_result.dart';
import 'package:fest_outdoor/widgets/guest_card.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuestView extends StatelessWidget {
  final DateTime day;
  final bool onlyFavorites;

  const GuestView({super.key, required this.day, this.onlyFavorites = false});

  List<Guest> filterGuests(List<Guest> guests, List<int> favorites) {
    return guests.where((element) {
      if (element.title.trim().isEmpty) {
        return false;
      }
      if (onlyFavorites) {
        return favorites.contains(element.id);
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final AsyncValue<List<Guest>> guests = ref.watch(
          guestsDayProvider(day, Localizations.localeOf(context).languageCode),
        );
        final AsyncValue<List<int>> favorites = ref.watch(
          guestsFavoritesProvider,
        );

        return switch (favorites) {
          AsyncData(value: final favorites) => switch (guests) {
            AsyncData(:final value) => RefreshIndicator(
              onRefresh: () => ref.refresh(
                guestsProvider(
                  Localizations.localeOf(context).languageCode,
                ).future,
              ),
              child: filterGuests(value, favorites).isEmpty
                  ? EmptyResult(
                      text: onlyFavorites
                          ? AppLocalizations.of(context)!.noFavoritesFound
                          : AppLocalizations.of(context)!.noGuestsFound,
                      icon: onlyFavorites ? Icons.favorite_outline : null,
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(
                        AppSpacing.lg,
                        AppSpacing.xs,
                        AppSpacing.lg,
                        AppSpacing.lg,
                      ),
                      itemCount: filterGuests(value, favorites).length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: AppSpacing.md),
                      itemBuilder: (context, index) {
                        final guest = filterGuests(value, favorites)[index];
                        final bool isFavourite = favorites.contains(guest.id);
                        return GuestCard(
                          guest: guest,
                          isFavorite: isFavourite,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => GuestDetail(guest: guest),
                              ),
                            );
                          },
                          onToggleFavorite: () {
                            ref
                                .read(guestsFavoritesProvider.notifier)
                                .toggleFavorite(guest.id);
                          },
                        );
                      },
                    ),
            ),
            AsyncError(:final error) => Text(error.toString()),
            _ => const Center(
              child: SizedBox.square(
                dimension: 32,
                child: CircularProgressIndicator(),
              ),
            ),
          },
          _ => const Center(
            child: SizedBox.square(
              dimension: 32,
              child: CircularProgressIndicator(),
            ),
          ),
        };
      },
    );
  }
}

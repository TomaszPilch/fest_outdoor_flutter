import 'package:fest_outdoor/localization/app_localizations.dart';
import 'package:fest_outdoor/models/guest.dart';
import 'package:fest_outdoor/providers/guests_day_provider.dart';
import 'package:fest_outdoor/providers/guests_favorites_provider.dart';
import 'package:fest_outdoor/providers/guests_provider.dart';
import 'package:fest_outdoor/views/guest_detail.dart';
import 'package:fest_outdoor/widgets/empty_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuestView extends StatelessWidget {
  final DateTime day;
  final bool onlyFavorites;

  const GuestView({super.key, required this.day, this.onlyFavorites = false});

  List<Guest> filterGuests(List<Guest> guests, List<int> favorites) {
    return guests.where((element) {
      if (onlyFavorites) {
        return favorites.contains(element.id);
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final AsyncValue<List<Guest>> guests = ref.watch(
          guestsDayProvider(day, Localizations.localeOf(context).languageCode));
      final AsyncValue<List<int>> favorites =
          ref.watch(guestsFavoritesProvider);

      return switch (favorites) {
        AsyncData(value: final favorites) => switch (guests) {
            AsyncData(:final value) => RefreshIndicator(
                onRefresh: () => ref.refresh(
                    guestsProvider(Localizations.localeOf(context).languageCode)
                        .future),
                child: filterGuests(value, favorites).isEmpty
                    ? EmptyResult(
                        text: onlyFavorites
                            ? AppLocalizations.of(context)!.noFavoritesFound
                            : AppLocalizations.of(context)!.noGuestsFound,
                        icon: onlyFavorites ? Icons.favorite_outline : null,
                      )
                    : ListView.separated(
                        itemCount: filterGuests(value, favorites).length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          final guest = filterGuests(value, favorites)[index];
                          final bool isFavourite = favorites.contains(guest.id);
                          return ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      GuestDetail(guest: guest)));
                            },
                            leading: Hero(
                                tag: "guest_photo_${guest.id}",
                                child: CircleAvatar(
                                  backgroundImage: guest.attributes.image !=
                                          null
                                      ? NetworkImage(
                                          'https://cms.pzkogrodek.cz${guest.attributes.image!.url}')
                                      : null,
                                )),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Badge(
                                  label: Text(guest.startEnd),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  child: const Icon(Icons.schedule_outlined),
                                ),
                                Text(guest.attributes.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(guest.attributes.description),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  ref
                                      .read(guestsFavoritesProvider.notifier)
                                      .toggleFavorite(guest.id);
                                },
                                icon: isFavourite
                                    ? const Icon(Icons.favorite)
                                    : const Icon(
                                        Icons.favorite_border_outlined)),
                            isThreeLine: true,
                          );
                        })),
            AsyncError(:final error) => Text(error.toString()),
            _ => const CircularProgressIndicator(),
          },
        _ => const CircularProgressIndicator(),
      };
    });
  }
}

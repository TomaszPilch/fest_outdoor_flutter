import 'package:fest_outdoor/models/guest.dart';
import 'package:fest_outdoor/providers/guests_favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuestDetailTimeFavorite extends StatelessWidget {
  final Guest guest;

  const GuestDetailTimeFavorite({super.key, required this.guest});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Badge(
            label: Text(guest.startDay),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: const Icon(Icons.calendar_today_outlined),
          ),
          Consumer(builder: (context, ref, child) {
            final AsyncValue<List<int>> favorites =
                ref.watch(guestsFavoritesProvider);
            return switch (favorites) {
              AsyncData(value: final favorites) => IconButton(
                  onPressed: () {
                    ref
                        .read(guestsFavoritesProvider.notifier)
                        .toggleFavorite(guest.id);
                  },
                  icon: favorites.contains(guest.id)
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border_outlined)),
              _ => const CircularProgressIndicator(),
            };
          }),
          Badge(
            label: Text(guest.startEnd),
            backgroundColor: Theme.of(context).colorScheme.primary,
            offset: const Offset(-75, -5),
            child: const Icon(Icons.schedule_outlined),
          ),
        ],
      ),
    );
  }
}

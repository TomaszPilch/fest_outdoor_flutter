import 'package:fest_outdoor/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const BottomNavigation(
      {super.key,
      required this.selectedIndex,
      required this.onDestinationSelected});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        onDestinationSelected: onDestinationSelected,
        selectedIndex: selectedIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: const Icon(Icons.person),
            icon: const Icon(Icons.person_outline),
            label: AppLocalizations.of(context)!.person,
          ),
          NavigationDestination(
            icon: const Icon(Icons.favorite_border),
            label: AppLocalizations.of(context)!.favorite,
            selectedIcon: const Icon(Icons.favorite),
          ),
          NavigationDestination(
            icon: const Icon(Icons.info_outline),
            selectedIcon: const Icon(Icons.info),
            label: AppLocalizations.of(context)!.info,
          ),
          NavigationDestination(
            icon: const Icon(Icons.feedback_outlined),
            selectedIcon: const Icon(Icons.feedback),
            label: AppLocalizations.of(context)!.feedback,
          ),
        ]);
  }
}

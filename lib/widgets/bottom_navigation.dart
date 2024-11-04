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
            icon: const Icon(Icons.settings_applications_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settings,
          ),
        ]);
  }
}

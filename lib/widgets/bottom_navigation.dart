import 'dart:ui';

import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const BottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface.withValues(alpha: 0.95),
            border: Border(top: BorderSide(color: theme.colorScheme.outline)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: NavigationBar(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: 0,
              height: 80,
              animationDuration: const Duration(milliseconds: 200),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              onDestinationSelected: onDestinationSelected,
              selectedIndex: selectedIndex,
              destinations: [
                NavigationDestination(
                  selectedIcon: const Icon(Icons.person),
                  icon: const Icon(Icons.person_outline),
                  label: l10n.person,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.favorite_border),
                  label: l10n.favorite,
                  selectedIcon: const Icon(Icons.favorite),
                ),
                NavigationDestination(
                  icon: const Icon(Icons.info_outline),
                  selectedIcon: const Icon(Icons.info),
                  label: l10n.info,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.feedback_outlined),
                  selectedIcon: const Icon(Icons.feedback),
                  label: l10n.feedback,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

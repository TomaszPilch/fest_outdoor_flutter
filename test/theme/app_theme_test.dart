import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  for (final entry in {
    'light': AppTheme.light,
    'dark': AppTheme.dark,
  }.entries) {
    testWidgets('${entry.key} theme styles standard Material components', (
      tester,
    ) async {
      final theme = entry.value;
      await tester.pumpWidget(
        MaterialApp(
          theme: theme,
          home: Scaffold(
            appBar: AppBar(title: const Text('Program')),
            body: Column(
              children: [
                const Card(child: Text('Guest')),
                FilledButton(onPressed: () {}, child: const Text('Continue')),
                const FilledButton(onPressed: null, child: Text('Disabled')),
                const TextField(decoration: InputDecoration(hintText: 'Email')),
                ChoiceChip(
                  label: const Text('Selected'),
                  selected: true,
                  onSelected: (_) {},
                ),
                ChoiceChip(
                  label: const Text('Unselected'),
                  selected: false,
                  onSelected: (_) {},
                ),
              ],
            ),
            bottomNavigationBar: NavigationBar(
              selectedIndex: 0,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.event),
                  label: 'Program',
                ),
                NavigationDestination(
                  icon: Icon(Icons.favorite_outline),
                  label: 'Favorites',
                ),
              ],
            ),
          ),
        ),
      );

      final context = tester.element(find.byType(Scaffold));
      final colors = AppThemeColors.of(context);
      expect(
        Theme.of(context).scaffoldBackgroundColor,
        theme.scaffoldBackgroundColor,
      );
      final appBarMaterial = tester.widget<Material>(
        find
            .descendant(
              of: find.byType(AppBar),
              matching: find.byType(Material),
            )
            .first,
      );
      expect(appBarMaterial.color, colors.header);
      final cardMaterial = tester.widget<Material>(
        find
            .descendant(of: find.byType(Card), matching: find.byType(Material))
            .first,
      );
      expect(cardMaterial.color, theme.colorScheme.surface);

      final buttons = tester.widgetList<Material>(
        find.descendant(
          of: find.byType(FilledButton),
          matching: find.byType(Material),
        ),
      );
      expect(buttons.first.color, theme.colorScheme.primary);
      expect(buttons.last.color, isNot(theme.colorScheme.primary));
      expect(
        DefaultTextStyle.of(tester.element(find.text('Selected'))).style.color,
        theme.colorScheme.onPrimary,
      );
      expect(
        DefaultTextStyle.of(
          tester.element(find.text('Unselected')),
        ).style.color,
        theme.colorScheme.onPrimaryContainer,
      );
      expect(
        IconTheme.of(tester.element(find.byIcon(Icons.event))).color,
        theme.colorScheme.onPrimary,
      );
      expect(
        DefaultTextStyle.of(
          tester.element(find.text('Continue')),
        ).style.fontFamily,
        AppTheme.bodyFont,
      );
      expect(
        DefaultTextStyle.of(
          tester.element(find.text('Program').first),
        ).style.fontFamily,
        AppTheme.displayFont,
      );

      await tester.tap(find.byType(TextField));
      await tester.pumpAndSettle();
      final decoration = tester
          .widget<InputDecorator>(find.byType(InputDecorator))
          .decoration;
      expect(
        (decoration.focusedBorder! as OutlineInputBorder).borderSide.color,
        colors.ring,
      );
      expect(tester.takeException(), isNull);
    });
  }

  test('semantic colors interpolate when switching themes', () {
    final light = AppTheme.light.extension<AppThemeColors>()!;
    final dark = AppTheme.dark.extension<AppThemeColors>()!;
    final midpoint = ThemeData.lerp(
      AppTheme.light,
      AppTheme.dark,
      0.5,
    ).extension<AppThemeColors>()!;

    expect(midpoint.success, Color.lerp(light.success, dark.success, 0.5));
    expect(midpoint.warning, Color.lerp(light.warning, dark.warning, 0.5));
    expect(midpoint.heroOverlay.colors, light.heroOverlay.colors);
  });
}

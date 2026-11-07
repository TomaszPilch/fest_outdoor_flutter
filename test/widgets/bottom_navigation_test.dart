import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:fest_outdoor/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('navigation keeps destinations and updates selected styling', (
    tester,
  ) async {
    var selected = 0;
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        locale: const Locale('cs'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: StatefulBuilder(
          builder: (context, setState) => Scaffold(
            bottomNavigationBar: BottomNavigation(
              selectedIndex: selected,
              onDestinationSelected: (value) =>
                  setState(() => selected = value),
            ),
          ),
        ),
      ),
    );

    final destinations = tester
        .widgetList<NavigationDestination>(find.byType(NavigationDestination))
        .map((destination) => destination.label);
    expect(destinations, ['Hosté', 'Oblíbení', 'Informace', 'Zpětná vazba']);
    expect(find.byType(BackdropFilter), findsOneWidget);
    final scheme = AppTheme.light.colorScheme;
    expect(
      IconTheme.of(tester.element(find.byIcon(Icons.person))).color,
      scheme.onPrimary,
    );

    await tester.tap(find.text('Zpětná vazba'));
    await tester.pumpAndSettle();
    expect(selected, 3);
    expect(
      tester.widget<NavigationBar>(find.byType(NavigationBar)).selectedIndex,
      3,
    );
    expect(
      IconTheme.of(tester.element(find.byIcon(Icons.feedback))).color,
      scheme.onPrimary,
    );
    expect(
      IconTheme.of(tester.element(find.byIcon(Icons.person_outline))).color,
      scheme.onSurfaceVariant,
    );
    expect(tester.takeException(), isNull);
  });
}

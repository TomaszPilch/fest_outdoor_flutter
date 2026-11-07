import 'package:fest_outdoor/models/guest.dart';
import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:fest_outdoor/widgets/guest_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('favorite button does not open guest details', (tester) async {
    var opened = 0;
    var toggled = 0;
    var favorite = false;
    final guest = Guest(
      id: 1,
      name: 'Anna Kowalska',
      title: 'Across the mountains',
      start: DateTime(2026, 11, 20, 17, 30),
      end: DateTime(2026, 11, 20, 18, 40),
      description: 'A mountain adventure',
      content: const [],
    );
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        locale: const Locale('cs'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: StatefulBuilder(
            builder: (context, setState) => GuestCard(
              guest: guest,
              isFavorite: favorite,
              onTap: () => opened++,
              onToggleFavorite: () => setState(() {
                toggled++;
                favorite = !favorite;
              }),
            ),
          ),
        ),
      ),
    );
    expect(find.text('AK'), findsOneWidget);
    expect(find.text('\u201eAcross the mountains\u201d'), findsOneWidget);
    expect(find.text('17:30 - 18:40'), findsOneWidget);
    await tester.tap(find.byTooltip('Přidat do oblíbených'));
    await tester.pumpAndSettle();
    expect(toggled, 1);
    expect(opened, 0);
    expect(find.byTooltip('Odebrat z oblíbených'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    await tester.tap(find.text('Anna Kowalska'));
    expect(opened, 1);
  });

  testWidgets('missing titles fit a narrow card with enlarged text', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        locale: const Locale('pl'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(2)),
          child: child!,
        ),
        home: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: GuestCard(
              guest: Guest(
                id: 1,
                start: DateTime(2026, 11, 20, 17, 30),
                end: DateTime(2026, 11, 20, 18, 40),
                description: 'Description',
                content: const [],
              ),
              isFavorite: false,
              onTap: () {},
              onToggleFavorite: () {},
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Gość zostanie ogłoszony'), findsOneWidget);
    expect(find.text('?'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

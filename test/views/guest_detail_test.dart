import 'package:fest_outdoor/models/guest.dart';
import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:fest_outdoor/views/guest_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets(
    'detail shows fallback avatar, content, favorites and back link',
    (tester) async {
      SharedPreferences.setMockInitialValues({});
      tester.view.physicalSize = const Size(320, 900);
      tester.view.devicePixelRatio = 1;
      tester.view.padding = const FakeViewPadding(top: 32);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.view.resetPadding);
      final guest = Guest(
        id: 5,
        name: 'Anna Kowalska',
        title: 'Across the mountains',
        start: DateTime(2026, 11, 20, 17, 30),
        end: DateTime(2026, 11, 20, 18, 40),
        description: 'Mountain adventure',
        content: const [
          {
            'type': 'paragraph',
            'children': [
              {'text': 'Guest biography'},
            ],
          },
        ],
      );
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            theme: AppTheme.light,
            locale: const Locale('cs'),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: Builder(
              builder: (context) => Scaffold(
                body: TextButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => GuestDetail(guest: guest),
                    ),
                  ),
                  child: const Text('Open guest'),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('Open guest'));
      await tester.pumpAndSettle();
      expect(
        tester
            .getTopLeft(find.byType(AnnotatedRegion<SystemUiOverlayStyle>))
            .dy,
        0,
      );
      expect(
        tester.getTopLeft(find.widgetWithText(TextButton, 'Program')).dy,
        greaterThanOrEqualTo(32),
      );
      expect(find.text('AK'), findsOneWidget);
      expect(find.text('Anna Kowalska'), findsOneWidget);
      expect(find.text('\u201eAcross the mountains\u201d'), findsOneWidget);
      expect(find.text('Mountain adventure'), findsNothing);
      expect(find.text('Guest biography'), findsOneWidget);
      expect(find.text('pátek 20. 11.'), findsOneWidget);
      expect(find.text('17:30 - 18:40'), findsOneWidget);
      await tester.tap(find.byTooltip('Přidat do oblíbených'));
      await tester.pumpAndSettle();
      expect(find.byTooltip('Odebrat z oblíbených'), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.tap(find.text('Program'));
      await tester.pumpAndSettle();
      expect(find.text('Open guest'), findsOneWidget);
    },
  );
}

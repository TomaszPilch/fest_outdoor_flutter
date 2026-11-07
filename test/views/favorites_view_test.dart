import 'package:fest_outdoor/models/guest.dart';
import 'package:fest_outdoor/providers/guests_provider.dart';
import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:fest_outdoor/utils/general.dart';
import 'package:fest_outdoor/views/favorites_view.dart';
import 'package:fest_outdoor/widgets/guest_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets(
    'empty favorites offer a return to the program without fetching',
    (tester) async {
      SharedPreferences.setMockInitialValues({});
      var browsed = false;
      var fetched = false;
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            guestsProvider('cs').overrideWith((ref) async {
              fetched = true;
              return [];
            }),
          ],
          child: MaterialApp(
            theme: AppTheme.light,
            locale: const Locale('cs'),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: Scaffold(
              body: FavoritesView(onBrowseProgram: () => browsed = true),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Zatím nemáte nic uloženo.'), findsOneWidget);
      expect(fetched, isFalse);
      await tester.tap(find.text('Projít program'));
      expect(browsed, isTrue);
    },
  );

  testWidgets(
    'favorites group both days and remove untitled or unsaved guests',
    (tester) async {
      SharedPreferences.setMockInitialValues({
        'favorites': ['1', '2', '3'],
      });
      final values = [
        for (var i = 1; i <= 4; i++)
          Guest(
            id: i,
            title: i == 3 ? '' : 'Talk $i',
            start: conferenceDays[i == 2 ? 1 : 0],
            end: conferenceDays[i == 2 ? 1 : 0].add(const Duration(hours: 1)),
            description: '',
            content: const [],
          ),
      ];
      await tester.pumpWidget(
        ProviderScope(
          overrides: [guestsProvider('cs').overrideWith((ref) async => values)],
          child: MaterialApp(
            theme: AppTheme.light,
            locale: const Locale('cs'),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: Scaffold(body: FavoritesView(onBrowseProgram: () {})),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(GuestCard), findsNWidgets(2));
      expect(find.text('Talk 4'), findsNothing);
      expect(find.text('?'), findsNothing);
      for (final day in conferenceDays) {
        final weekday = DateFormat('EEEE', 'cs').format(day);
        expect(
          find.text('${weekday[0].toUpperCase()}${weekday.substring(1)}'),
          findsOneWidget,
        );
      }
      await tester.tap(find.byTooltip('Odebrat z oblíbených').first);
      await tester.pumpAndSettle();
      expect(find.text('Talk 1'), findsNothing);
      expect(find.byType(GuestCard), findsOneWidget);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getStringList('favorites'), ['2', '3']);
      expect(tester.takeException(), isNull);
    },
  );
}

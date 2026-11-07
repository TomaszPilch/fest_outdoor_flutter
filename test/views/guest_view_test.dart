import 'dart:async';

import 'package:fest_outdoor/models/guest.dart';
import 'package:fest_outdoor/providers/guests_day_provider.dart';
import 'package:fest_outdoor/providers/guests_favorites_provider.dart';
import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/views/guest_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _Favorites extends GuestsFavorites {
  final Future<List<int>> result;

  _Favorites(this.result);

  @override
  Future<List<int>> build() => result;
}

void main() {
  for (final loadingFavorites in [false, true]) {
    testWidgets(
      'loading ${loadingFavorites ? 'favorites' : 'guests'} uses a centered small spinner',
      (tester) async {
        final day = DateTime(2026, 11, 20);
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              guestsFavoritesProvider.overrideWith(
                () => _Favorites(
                  loadingFavorites
                      ? Completer<List<int>>().future
                      : Future.value([]),
                ),
              ),
              guestsDayProvider(
                day,
                'cs',
              ).overrideWith((ref) => Completer<List<Guest>>().future),
            ],
            child: MaterialApp(
              locale: const Locale('cs'),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: Scaffold(
                body: SizedBox(
                  width: 320,
                  height: 400,
                  child: GuestView(day: day),
                ),
              ),
            ),
          ),
        );
        await tester.pump();
        final spinner = find.byType(CircularProgressIndicator);
        expect(tester.getSize(spinner), const Size(32, 32));
        expect(
          tester.getCenter(spinner),
          tester.getCenter(find.byType(GuestView)),
        );
        expect(tester.takeException(), isNull);
      },
    );
  }

  test('program and favorites exclude guests without a title', () {
    final day = DateTime(2026, 11, 20);
    final guests = [
      for (final entry in {
        1: '',
        2: ' \t\n',
        3: 'Guest',
        4: 'Other guest',
      }.entries)
        Guest(
          id: entry.key,
          title: entry.value,
          start: day,
          end: day.add(const Duration(hours: 1)),
          description: '',
          content: const [],
        ),
    ];

    expect(
      GuestView(
        day: day,
      ).filterGuests(guests, [1, 2, 3]).map((guest) => guest.id),
      [3, 4],
    );
    expect(
      GuestView(
        day: day,
        onlyFavorites: true,
      ).filterGuests(guests, [1, 2, 3]).map((guest) => guest.id),
      [3],
    );
  });
}

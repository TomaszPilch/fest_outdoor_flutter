import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/models/guest.dart';
import 'package:fest_outdoor/providers/guests_day_provider.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:fest_outdoor/utils/general.dart';
import 'package:fest_outdoor/views/home.dart';
import 'package:fest_outdoor/widgets/festival_hero.dart';
import 'package:fest_outdoor/widgets/day_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('program hero scrolls with guests and stays off other pages', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    tester.view.padding = const FakeViewPadding(top: 32, bottom: 24);
    addTearDown(tester.view.resetPadding);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          for (final day in conferenceDays)
            guestsDayProvider(day, 'cs').overrideWith(
              (ref) async => [
                for (var i = 0; i < 20; i++)
                  Guest(
                    id: i,
                    title: 'Guest $i',
                    start: day,
                    end: day.add(const Duration(hours: 1)),
                    description: 'Talk',
                    content: const [],
                  ),
              ],
            ),
        ],
        child: MaterialApp(
          theme: AppTheme.light,
          locale: const Locale('cs'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const Home(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(FestivalHero), findsOneWidget);
    expect(tester.getTopLeft(find.byType(FestivalHero)).dy, 0);
    expect(
      tester.getSize(find.byType(FestivalHero)).width,
      tester.view.physicalSize.width / tester.view.devicePixelRatio,
    );
    expect(tester.getTopLeft(find.text('FEST')).dy, greaterThanOrEqualTo(32));
    expect(find.byType(AppBar), findsNothing);
    expect(find.text('Dům PZKO Hrádek'), findsOneWidget);
    final dayPicker = tester.widget<DayPicker>(find.byType(DayPicker));
    expect(dayPicker.showWeekday, isTrue);
    final lastWeekday = DateFormat('EEEE', 'cs').format(conferenceDays.last);
    await tester.tap(
      find.text('${lastWeekday[0].toUpperCase()}${lastWeekday.substring(1)}'),
    );
    await tester.pumpAndSettle();
    expect(dayPicker.controller.index, 1);
    await tester.drag(find.byType(ListView).first, const Offset(0, -400));
    await tester.pumpAndSettle();
    expect(find.text('FEST').hitTestable(), findsNothing);
    await tester.tap(find.byIcon(Icons.favorite_border).last);
    await tester.pumpAndSettle();
    expect(find.byType(FestivalHero), findsNothing);
    expect(find.byType(AppBar), findsNothing);
    expect(find.text('Váš osobní program festivalu'), findsOneWidget);
    final favoritesHeader = find.ancestor(
      of: find.text('Váš osobní program festivalu'),
      matching: find.byType(AnnotatedRegion<SystemUiOverlayStyle>),
    );
    expect(tester.getTopLeft(favoritesHeader).dy, 0);
    expect(
      tester.getTopLeft(find.text('Váš osobní program festivalu')).dy,
      greaterThanOrEqualTo(32),
    );
    expect(tester.takeException(), isNull);
  });

  for (final locale in AppLocalizations.supportedLocales) {
    testWidgets('hero shows configured dates in ${locale.languageCode}', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.light,
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const Scaffold(
            body: SingleChildScrollView(child: FestivalHero()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('FEST'), findsOneWidget);
      expect(find.text('Outdoor'), findsOneWidget);
      final lastDate = DateFormat(
        'd MMMM yyyy',
        locale.languageCode,
      ).format(conferenceDays.last).toUpperCase();
      expect(find.textContaining(lastDate), findsOneWidget);
      final town = locale.languageCode == 'pl' ? 'GR\u00d3DEK' : 'HR\u00c1DEK';
      expect(find.textContaining('\u2022 $town'), findsOneWidget);
      if (locale.languageCode == 'pl') {
        expect(find.textContaining('HR\u00c1DEK'), findsNothing);
      }
      final image = tester.widget<Image>(find.byType(Image));
      expect(
        (image.image as AssetImage).assetName,
        'assets/images/festival_hero.jpg',
      );
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('hero fits narrow screens with enlarged text', (tester) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        locale: const Locale('cs'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(2)),
          child: child!,
        ),
        home: const Scaffold(
          body: SingleChildScrollView(child: FestivalHero()),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}

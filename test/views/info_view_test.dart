import 'package:fest_outdoor/models/guest.dart';
import 'package:fest_outdoor/providers/guests_provider.dart';
import 'package:fest_outdoor/providers/info_provider.dart';
import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:fest_outdoor/utils/general.dart';
import 'package:fest_outdoor/views/info_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('info preserves CMS content and opens the template ticket link', (
    tester,
  ) async {
    tester.view.padding = const FakeViewPadding(top: 32);
    addTearDown(tester.view.resetPadding);
    MethodCall? launch;
    const channel = MethodChannel('plugins.flutter.io/url_launcher');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          launch = call;
          return true;
        });
    addTearDown(
      () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null),
    );
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          infoProvider('cs').overrideWith(
            (ref) async => [
              {
                'type': 'paragraph',
                'children': [
                  {'text': 'CMS festival information'},
                ],
              },
            ],
          ),
          guestsProvider('cs').overrideWith(
            (ref) async => [
              for (final title in ['Guest', ''])
                Guest(
                  id: title.length,
                  title: title,
                  start: conferenceDays.first,
                  end: conferenceDays.first.add(const Duration(hours: 1)),
                  description: '',
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
          home: const Scaffold(body: InfoView()),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('O festivalu'), findsOneWidget);
    final header = find.ancestor(
      of: find.text('O festivalu'),
      matching: find.byType(AnnotatedRegion<SystemUiOverlayStyle>),
    );
    expect(tester.getTopLeft(header).dy, 0);
    expect(
      tester.getTopLeft(find.text('O festivalu')).dy,
      greaterThanOrEqualTo(32),
    );
    expect(find.text('Dům PZKO Hrádek'), findsOneWidget);
    expect(find.text('1 host'), findsOneWidget);
    expect(find.text('2 dny programu'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('CMS festival information', findRichText: true),
      200,
    );
    expect(
      find.text('CMS festival information', findRichText: true),
      findsOneWidget,
    );
    await tester.scrollUntilVisible(find.text('Koupit vstupenku'), 200);
    await tester.pumpAndSettle();
    expect(
      tester.getBottomLeft(find.byType(Image)).dy,
      lessThan(tester.getTopLeft(find.byType(FilledButton)).dy),
    );
    await tester.tap(find.text('Koupit vstupenku'));
    await tester.pumpAndSettle();
    expect(launch!.arguments['url'], 'https://form.simpleshop.cz/xKaP9');
    expect(tester.takeException(), isNull);
  });

  testWidgets('Polish info wraps on narrow screens and handles CMS errors', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          infoProvider(
            'pl',
          ).overrideWith((ref) async => throw Exception('offline')),
          guestsProvider('pl').overrideWith((ref) async => []),
        ],
        child: MaterialApp(
          theme: AppTheme.light,
          locale: const Locale('pl'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(1.5)),
            child: child!,
          ),
          home: const Scaffold(body: InfoView()),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('O festiwalu'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Nie udało się wczytać informacji'),
      200,
    );
    expect(find.text('Spróbuj ponownie'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Morsowanie'), 200);
    final tileHeights = [
      for (final label in [
        'Morsowanie',
        'Jedzenie i napoje',
        'Impreza finałowa',
      ])
        tester
            .getSize(
              find
                  .ancestor(
                    of: find.text(label),
                    matching: find.byType(Container),
                  )
                  .first,
            )
            .height,
    ];
    expect(tileHeights[0], tileHeights[1]);
    expect(tileHeights[1], tileHeights[2]);
    await tester.scrollUntilVisible(find.text('Kup bilet'), 200);
    expect(tester.takeException(), isNull);
  });
}

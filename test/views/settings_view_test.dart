import 'dart:async';

import 'package:fest_outdoor/providers/token_provider.dart';
import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:fest_outdoor/views/settings_view.dart';
import 'package:fest_outdoor/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _Token extends Token {
  final completion = Completer<void>();
  String? identifier;
  String? password;
  int attempts = 0;
  int logouts = 0;

  @override
  Future<String?> build() async => null;

  @override
  Future<void> login(String email, String password) async {
    identifier = email;
    this.password = password;
    attempts++;
    await completion.future;
    state = const AsyncData('test-token');
  }

  @override
  Future<void> removeToken() async {
    logouts++;
    state = const AsyncData(null);
  }
}

void main() {
  Future<void> pumpSettings(
    WidgetTester tester,
    _Token token, {
    Locale locale = const Locale('cs'),
    double textScale = 1,
  }) async {
    tester.view.physicalSize = const Size(320, 900);
    tester.view.devicePixelRatio = 1;
    tester.view.padding = const FakeViewPadding(top: 32);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPadding);
    await tester.pumpWidget(
      ProviderScope(
        overrides: [tokenProvider.overrideWith(() => token)],
        child: MaterialApp(
          theme: AppTheme.light,
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.linear(textScale)),
            child: child!,
          ),
          home: const SettingsView(),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('login fills available width and protects status-bar controls', (
    tester,
  ) async {
    await pumpSettings(tester, _Token());
    final header = find.ancestor(
      of: find.text('Přihlášení'),
      matching: find.byType(AnnotatedRegion<SystemUiOverlayStyle>),
    );
    expect(tester.getTopLeft(header).dy, 0);
    expect(tester.getSize(header).width, 320);
    expect(find.text('FEST Outdoor'), findsNothing);
    expect(find.text('Kontrola vstupenek'), findsNothing);
    expect(
      tester.getTopLeft(find.byTooltip('Zpět')).dy,
      greaterThanOrEqualTo(32),
    );
    expect(
      tester.getSize(find.byType(TextFormField).first).width,
      320 - AppSpacing.lg * 2,
    );
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNull,
    );
    await tester.enterText(find.byType(TextFormField).first, 'organizer');
    await tester.enterText(find.byType(TextFormField).last, 'test-password');
    await tester.tap(find.byTooltip('Zobrazit heslo'));
    await tester.pump();
    expect(
      tester.widget<EditableText>(find.byType(EditableText).last).obscureText,
      isFalse,
    );
    await tester.tap(find.byTooltip('Skrýt heslo'));
    await tester.pump();
    expect(
      tester.widget<EditableText>(find.byType(EditableText).last).obscureText,
      isTrue,
    );
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNotNull,
    );
    await tester.enterText(find.byType(TextFormField).first, ' ');
    await tester.pump();
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNull,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('login waits for authentication and logout restores the form', (
    tester,
  ) async {
    final token = _Token();
    await pumpSettings(tester, token);
    await tester.enterText(find.byType(TextFormField).first, 'organizer');
    await tester.enterText(find.byType(TextFormField).last, 'test-password');
    await tester.ensureVisible(find.byType(FilledButton));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(FilledButton));
    await tester.pump();
    expect(token.identifier, 'organizer');
    expect(token.password, 'test-password');
    expect(token.attempts, 1);
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNull,
    );
    expect(find.text('Odhlásit'), findsNothing);
    token.completion.complete();
    await tester.pumpAndSettle();
    expect(find.byType(LoginForm), findsNothing);
    expect(find.text('Odhlásit'), findsOneWidget);
    expect(find.byIcon(Icons.qr_code_scanner), findsOneWidget);
    await tester.tap(find.text('Odhlásit'));
    await tester.pumpAndSettle();
    expect(token.logouts, 1);
    expect(find.byType(LoginForm), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('failed authentication retains the form and enables retry', (
    tester,
  ) async {
    final token = _Token();
    await pumpSettings(tester, token);
    await tester.enterText(find.byType(TextFormField).first, 'organizer');
    await tester.enterText(find.byType(TextFormField).last, 'test-password');
    await tester.ensureVisible(find.byType(FilledButton));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(FilledButton));
    await tester.pump();
    token.completion.completeError(Exception('offline'));
    await tester.pumpAndSettle();
    expect(
      find.text(
        'Přihlášení se nezdařilo. Zkontrolujte údaje a zkuste to znovu.',
      ),
      findsOneWidget,
    );
    expect(
      tester
          .widget<TextFormField>(find.byType(TextFormField).first)
          .controller!
          .text,
      'organizer',
    );
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNotNull,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('Polish login remains scrollable with enlarged text', (
    tester,
  ) async {
    await pumpSettings(
      tester,
      _Token(),
      locale: const Locale('pl'),
      textScale: 2,
    );
    expect(find.text('Dostęp dla organizatorów'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Zaloguj'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();
    expect(find.text('Zaloguj').hitTestable(), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

import 'dart:async';

import 'package:fest_outdoor/models/ticket.dart';
import 'package:fest_outdoor/models/ticket_log.dart';
import 'package:fest_outdoor/providers/ticket_detail_provider.dart'
    as providers;
import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:fest_outdoor/views/ticket_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _TicketDetail extends providers.TicketDetail {
  _TicketDetail(this.ticket);

  Ticket? ticket;
  bool loadFailed = false;
  bool confirmationFailed = false;
  Completer<void>? confirmation;
  int confirmations = 0;

  @override
  Future<Ticket?> build(String code) async {
    if (loadFailed) throw Exception('offline');
    return ticket;
  }

  @override
  Future<void> confirmTicket() async {
    confirmations++;
    await confirmation?.future;
    if (confirmationFailed) throw Exception('confirmation failed');
    ticket = ticket!.copyWith(
      logs: [
        ...?ticket!.logs,
        TicketLog(id: 3, code: code, scanTime: DateTime(2026, 11, 21, 12, 45)),
      ],
    );
    state = AsyncData(ticket);
  }
}

void main() {
  const code = '36K7M7KN';
  const ticket = Ticket(
    id: 1,
    code: code,
    name: 'Marie Kowalczyk',
    email: 'marie@example.com',
    person: 'Adult',
  );

  Future<void> pumpDetail(
    WidgetTester tester,
    _TicketDetail detail, {
    Locale locale = const Locale('cs'),
    double textScale = 1,
  }) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      ProviderScope(
        retry: (_, _) => null,
        overrides: [
          providers.ticketDetailProvider(code).overrideWith(() => detail),
        ],
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
          home: Scaffold(
            body: Builder(
              builder: (context) => TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const TicketDetail(code: code),
                  ),
                ),
                child: const Text('Open ticket'),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Open ticket'));
    await tester.pumpAndSettle();
  }

  Future<void> tapVisible(WidgetTester tester, String text) async {
    await tester.ensureVisible(find.text(text));
    await tester.pumpAndSettle();
    await tester.tap(find.text(text));
    await tester.pump();
  }

  testWidgets(
    'valid ticket preserves details and returns to the previous page',
    (tester) async {
      await pumpDetail(tester, _TicketDetail(ticket));
      for (final text in [
        'Platný lístek',
        ticket.name,
        code,
        ticket.email!,
        ticket.person!,
        'Historie vstupů',
        'Zatím žádné záznamy.',
        'Potvrdit vstupenku',
      ]) {
        expect(find.text(text), findsOneWidget);
      }
      await tapVisible(tester, 'Skenovat další');
      await tester.pumpAndSettle();
      expect(find.byType(TicketDetail), findsNothing);
      expect(find.text('Open ticket').hitTestable(), findsOneWidget);
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'used ticket keeps every log and confirmation waits for the API',
    (tester) async {
      final detail = _TicketDetail(
        ticket.copyWith(
          logs: [
            TicketLog(
              id: 1,
              code: code,
              scanTime: DateTime(2026, 11, 20, 10, 32),
            ),
            TicketLog(
              id: 2,
              code: code,
              scanTime: DateTime(2026, 11, 21, 11, 15),
            ),
          ],
        ),
      )..confirmation = Completer<void>();
      await pumpDetail(tester, detail);
      expect(find.text('Lístek už byl použit'), findsOneWidget);
      expect(find.text('Sken: 20.11.2026 10:32'), findsOneWidget);
      expect(find.text('Sken: 21.11.2026 11:15'), findsOneWidget);
      await tapVisible(tester, 'Potvrdit vstupenku');
      expect(detail.confirmations, 1);
      expect(
        tester.widget<OutlinedButton>(find.byType(OutlinedButton)).onPressed,
        isNull,
      );
      expect(
        tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
        isNull,
      );
      detail.confirmation!.complete();
      await tester.pumpAndSettle();
      expect(find.text('Sken: 21.11.2026 12:45'), findsOneWidget);
      expect(find.text('Sken: 20.11.2026 10:32'), findsOneWidget);
      expect(
        tester.widget<OutlinedButton>(find.byType(OutlinedButton)).onPressed,
        isNotNull,
      );
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets('missing tickets retain the code and cannot be confirmed', (
    tester,
  ) async {
    await pumpDetail(tester, _TicketDetail(null));
    expect(find.text('Neplatný lístek'), findsOneWidget);
    expect(find.text('Vstupenka nenalezena'), findsOneWidget);
    expect(find.text(code), findsOneWidget);
    expect(find.text('N/A'), findsNWidgets(2));
    expect(find.text('Potvrdit vstupenku'), findsNothing);
    await tapVisible(tester, 'Skenovat další');
    await tester.pumpAndSettle();
    expect(find.byType(TicketDetail), findsNothing);
  });

  testWidgets('load and confirmation errors can be retried', (tester) async {
    final detail = _TicketDetail(ticket)..loadFailed = true;
    await pumpDetail(tester, detail);
    expect(find.text('Vstupenku se nepodařilo načíst'), findsOneWidget);
    expect(find.text('Exception: offline'), findsOneWidget);
    expect(find.text(code), findsOneWidget);
    detail.loadFailed = false;
    await tapVisible(tester, 'Zkusit znovu');
    await tester.pumpAndSettle();
    expect(find.text(ticket.name), findsOneWidget);

    detail.confirmationFailed = true;
    await tapVisible(tester, 'Potvrdit vstupenku');
    await tester.pumpAndSettle();
    expect(
      find.text('Vstupenku se nepodařilo potvrdit. Zkuste to znovu.'),
      findsOneWidget,
    );
    detail.confirmationFailed = false;
    await tapVisible(tester, 'Potvrdit vstupenku');
    await tester.pumpAndSettle();
    expect(detail.confirmations, 2);
    expect(find.text('Lístek už byl použit'), findsOneWidget);
    expect(
      find.text('Vstupenku se nepodařilo potvrdit. Zkuste to znovu.'),
      findsNothing,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('Polish ticket with long fields supports enlarged text', (
    tester,
  ) async {
    final longEmail = 'very.long.ticket.email.address@example.com';
    await pumpDetail(
      tester,
      _TicketDetail(ticket.copyWith(email: longEmail)),
      locale: const Locale('pl'),
      textScale: 2,
    );
    expect(find.text('Ważny bilet'), findsOneWidget);
    expect(find.text(longEmail), findsOneWidget);
    await tester.ensureVisible(find.text('Potwierdź bilet'));
    await tester.pumpAndSettle();
    expect(find.text('Potwierdź bilet').hitTestable(), findsOneWidget);
    await tapVisible(tester, 'Skanuj kolejny');
    await tester.pumpAndSettle();
    expect(find.byType(TicketDetail), findsNothing);
    expect(tester.takeException(), isNull);
  });
}

import 'dart:async';

import 'package:fest_outdoor/providers/feedback_provider.dart';
import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:fest_outdoor/widgets/feedback_form.dart';
import 'package:flutter/material.dart' hide Feedback;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _Feedback extends Feedback {
  Completer<void> completion = Completer<void>();
  int? rating;

  @override
  Future<List<String>> build() async => [];

  @override
  Future<void> addFeedback(String name, String content, int rating) {
    this.rating = rating;
    return completion.future;
  }
}

void main() {
  Future<void> pumpForm(WidgetTester tester, _Feedback feedback) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [feedbackProvider.overrideWith(() => feedback)],
        child: MaterialApp(
          theme: AppTheme.light,
          locale: const Locale('cs'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: FeedbackForm(),
            ),
          ),
        ),
      ),
    );
    await tester.enterText(find.byType(TextFormField).first, 'Guest');
    await tester.enterText(find.byType(TextFormField).last, 'Great festival');
    await tester.tap(find.byTooltip('4 z 5 hvězdiček'));
    await tester.tap(find.text('Odeslat'));
    await tester.pump();
  }

  testWidgets('success waits for the API and preserves the rating scale', (
    tester,
  ) async {
    final feedback = _Feedback();
    await pumpForm(tester, feedback);
    expect(feedback.rating, 40);
    expect(find.text('Děkujeme za zpětnou vazbu'), findsNothing);
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNull,
    );
    feedback.completion.complete();
    await tester.pumpAndSettle();
    expect(find.text('Děkujeme za zpětnou vazbu'), findsOneWidget);
  });

  testWidgets('failed submission keeps the form available for retry', (
    tester,
  ) async {
    final feedback = _Feedback();
    await pumpForm(tester, feedback);
    feedback.completion.completeError(Exception('offline'));
    await tester.pumpAndSettle();
    expect(
      find.text('Hodnocení se nepodařilo odeslat. Zkuste to znovu.'),
      findsOneWidget,
    );
    expect(find.text('Děkujeme za zpětnou vazbu'), findsNothing);
    expect(
      tester
          .widget<TextFormField>(find.byType(TextFormField).last)
          .controller!
          .text,
      'Great festival',
    );
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNotNull,
    );
  });
}

import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:fest_outdoor/widgets/content_block.dart';
import 'package:fest_outdoor/widgets/paragraph.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const channel = MethodChannel('plugins.flutter.io/url_launcher');
  late List<MethodCall> calls;
  var launchSucceeds = true;

  setUp(() {
    calls = [];
    launchSucceeds = true;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          calls.add(call);
          return launchSucceeds;
        });
  });
  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  Future<void> pumpContent(WidgetTester tester, List<dynamic> content) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        locale: const Locale('cs'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: ContentBlock(content: content)),
      ),
    );
  }

  Future<void> tapLink(WidgetTester tester) async {
    final richText = find
        .descendant(of: find.byType(Paragraph), matching: find.byType(RichText))
        .first;
    final render = tester.renderObject<RenderParagraph>(richText);
    final boxes = render.getBoxesForSelection(
      const TextSelection(baseOffset: 6, extentOffset: 13),
    );
    await tester.tapAt(render.localToGlobal(boxes.first.toRect().center));
    await tester.pumpAndSettle();
  }

  const inline = [
    {'type': 'text', 'text': 'Visit '},
    {
      'type': 'link',
      'url': 'https://example.com',
      'children': [
        {'type': 'text', 'text': 'website'},
      ],
    },
    {'type': 'text', 'text': ' for more.'},
  ];

  testWidgets('CMS links stay inline, including in lists, and launch URLs', (
    tester,
  ) async {
    await pumpContent(tester, [
      {'type': 'paragraph', 'children': inline},
      {
        'type': 'list',
        'children': [
          {'type': 'list-item', 'children': inline},
        ],
      },
    ]);
    expect(
      find.text('Visit website for more.', findRichText: true),
      findsNWidgets(2),
    );
    await tapLink(tester);
    expect(calls.single.arguments['url'], 'https://example.com');
    expect(tester.takeException(), isNull);
  });

  testWidgets('failed launches show a localized message', (tester) async {
    launchSucceeds = false;
    await pumpContent(tester, [
      {'type': 'paragraph', 'children': inline},
    ]);
    await tapLink(tester);
    expect(find.text('Odkaz se nepodařilo otevřít'), findsOneWidget);
  });

  testWidgets('unsupported links remain readable without launching', (
    tester,
  ) async {
    await pumpContent(tester, [
      {
        'type': 'paragraph',
        'children': [
          {'type': 'text', 'text': 'Visit '},
          {
            'type': 'link',
            'url': 'javascript:alert(1)',
            'children': [
              {'type': 'text', 'text': 'website'},
            ],
          },
        ],
      },
    ]);
    await tapLink(tester);
    expect(calls, isEmpty);
    expect(find.text('Visit website', findRichText: true), findsOneWidget);
  });
}

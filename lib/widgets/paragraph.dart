import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Paragraph extends StatefulWidget {
  final List<dynamic> content;

  const Paragraph({super.key, required this.content});

  @override
  State<Paragraph> createState() => _ParagraphState();
}

class _ParagraphState extends State<Paragraph> {
  final List<TapGestureRecognizer> _recognizers = [];

  void _disposeRecognizers() {
    for (final recognizer in _recognizers) {
      recognizer.dispose();
    }
    _recognizers.clear();
  }

  @override
  void dispose() {
    _disposeRecognizers();
    super.dispose();
  }

  Future<void> _openLink(Uri uri) async {
    var opened = false;
    try {
      opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
    } on PlatformException {
      opened = false;
    }
    if (!opened && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.unableToOpenLink)),
      );
    }
  }

  TextSpan _span(Map<dynamic, dynamic> node, {TapGestureRecognizer? link}) {
    if (node['type'] == 'link') {
      final url = node['url'];
      final uri = url is String ? Uri.tryParse(url) : null;
      final supported =
          uri != null &&
          const ['https', 'http', 'mailto', 'tel'].contains(uri.scheme) &&
          (!const ['https', 'http'].contains(uri.scheme) ||
              uri.host.isNotEmpty);
      if (supported) {
        link = TapGestureRecognizer()..onTap = () => _openLink(uri);
        _recognizers.add(link);
      }
    }
    final children = node['children'];
    return TextSpan(
      text: node['text'] as String?,
      recognizer: link,
      mouseCursor: link == null ? null : SystemMouseCursors.click,
      style: link == null
          ? null
          : TextStyle(
              color: Theme.of(context).colorScheme.primary,
              decoration: TextDecoration.underline,
            ),
      children: children is List
          ? [
              for (final child in children)
                if (child is Map) _span(child, link: link),
            ]
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    _disposeRecognizers();
    return Text.rich(
      TextSpan(
        children: [
          for (final node in widget.content)
            if (node is Map) _span(node),
        ],
      ),
      textAlign: TextAlign.justify,
    );
  }
}

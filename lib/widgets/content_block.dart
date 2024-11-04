import 'package:fest_outdoor/widgets/paragraph.dart';
import 'package:flutter/material.dart';

class ContentBlock extends StatelessWidget {
  final List<Map<String, dynamic>> content;

  const ContentBlock({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: content.map((e) {
        if (e['type'] == 'paragraph') {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Paragraph(content: e['children']),
          );
        }
        return const SizedBox.shrink();
      }).toList(),
    );
  }
}

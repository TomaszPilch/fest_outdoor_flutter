import 'package:fest_outdoor/widgets/paragraph.dart';
import 'package:flutter/material.dart';

class ContentBlock extends StatelessWidget {
  final List<dynamic> content;

  const ContentBlock({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: content.map((e) {
          if (e['type'] == 'paragraph') {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Paragraph(content: e['children']),
            );
          }
          if (e['type'] == 'list') {
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: ContentBlock(content: e['children'] as List<dynamic>));
          }
          if (e['type'] == 'list-item') {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.circle_outlined,
                  size: 8,
                ),
                const SizedBox(width: 8),
                Paragraph(content: e['children']),
              ],
            );
          }
          return const SizedBox.shrink();
        }).toList(),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

class Paragraph extends StatelessWidget {
  final List<dynamic> content;

  const Paragraph({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: content.map((e) {
        if (e['text'] == null) {
          return const SizedBox.shrink();
        }
        return Text(e['text']);
      }).toList(),
    );
  }
}

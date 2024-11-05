import 'package:flutter/material.dart';

class EmptyResult extends StatelessWidget {
  final String text;
  final IconData? icon;

  const EmptyResult({super.key, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon ?? Icons.sentiment_satisfied_alt,
          size: 45,
        ),
        Text(text),
      ],
    ));
  }
}

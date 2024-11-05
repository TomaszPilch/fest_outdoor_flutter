import 'package:fest_outdoor/localization/app_localizations.dart';
import 'package:fest_outdoor/providers/info_provider.dart';
import 'package:fest_outdoor/widgets/content_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Center(
          child: Text(
            AppLocalizations.of(context)!.infoTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer(builder: (context, ref, child) {
          final AsyncValue<List<dynamic>> info = ref.watch(
              infoProvider(Localizations.localeOf(context).languageCode));

          return switch (info) {
            AsyncData(:final value) => ContentBlock(content: value),
            AsyncError(:final error) => Text('Error: $error'),
            _ => const Center(child: CircularProgressIndicator()),
          };
        })
      ],
    );
  }
}

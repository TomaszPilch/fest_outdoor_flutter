import 'package:fest_outdoor/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class TicketDetail extends StatelessWidget {
  final String code;
  const TicketDetail({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.onSecondary,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(AppLocalizations.of(context)!.tickets),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Center(
              child: Text(
                code,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ));
  }
}

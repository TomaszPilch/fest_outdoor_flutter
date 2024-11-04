import 'package:fest_outdoor/localization/app_localizations.dart';
import 'package:fest_outdoor/models/ticket.dart';
import 'package:fest_outdoor/providers/ticket_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
            const SizedBox(height: 24),
            Consumer(builder: (context, ref, child) {
              final AsyncValue<Ticket?> ticketDetail =
                  ref.watch(ticketDetailProvider(code));

              return switch (ticketDetail) {
                AsyncData(:final value) => Column(
                    children: [
                      Text('Name: ${value?.name ?? 'N/A'}'),
                      Text('Email: ${value?.email ?? 'N/A'}'),
                      Text('Person: ${value?.person ?? 'N/A'}'),
                      const Divider(),
                      if (value != null)
                        ElevatedButton(
                          onPressed: () async {
                            await ref
                                .read(ticketDetailProvider(code).notifier)
                                .confirmTicket();
                          },
                          child:
                              Text(AppLocalizations.of(context)!.confirmTicket),
                        ),
                      if (value == null)
                        Text(
                          'Ticket not found',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.error),
                        ),
                      const Divider(),
                      const Text('Logs:'),
                      ...(value?.logs ?? []).map((log) => Text(
                                'Scan: ${DateFormat('dd.MM.yyyy HH:mm').format(log.scanTime)}',
                                style: TextStyle(
                                    color: Theme.of(context).colorScheme.error),
                              )) ??
                          [],
                    ],
                  ),
                AsyncError(:final error) => Text('Error: $error'),
                _ => const Center(child: CircularProgressIndicator()),
              };
            })
          ],
        ));
  }
}

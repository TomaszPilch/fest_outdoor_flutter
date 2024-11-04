import 'package:fest_outdoor/localization/app_localizations.dart';
import 'package:fest_outdoor/providers/token_provider.dart';
import 'package:fest_outdoor/views/ticket_view.dart';
import 'package:fest_outdoor/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Center(
          child: Text(AppLocalizations.of(context)!.settings,
              style: Theme.of(context).textTheme.titleLarge),
        ),
        const SizedBox(height: 24),
        Consumer(builder: (context, ref, child) {
          final AsyncValue<String?> token = ref.watch(tokenProvider);

          return token.when(
            data: (value) {
              if (value != null) {
                return Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const TicketView()));
                      },
                      child: Text(AppLocalizations.of(context)!.goToTicketView),
                    ),
                    const SizedBox(height: 24),
                    TextButton(
                      onPressed: () async {
                        await ref.read(tokenProvider.notifier).removeToken();
                      },
                      child: Text(AppLocalizations.of(context)!.logout),
                    )
                  ],
                );
              }

              return const LoginForm();
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Text('Error: $error'),
          );
        })
      ],
    );
  }
}

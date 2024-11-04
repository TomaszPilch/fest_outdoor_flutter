import 'package:fest_outdoor/localization/app_localizations.dart';
import 'package:fest_outdoor/providers/token_provider.dart';
import 'package:fest_outdoor/views/ticket_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              width: 250,
              child: TextFormField(
                textInputAction: TextInputAction.next,
                controller: _emailController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.emailLabel),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.emailRequired;
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 250,
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: AppLocalizations.of(context)!.passwordLabel,
                ),
                onFieldSubmitted: (value) async {
                  if (_formKey.currentState!.validate()) {
                    ref
                        .read(tokenProvider.notifier)
                        .login(_emailController.text, _passwordController.text);
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.passwordRequired;
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TicketView()));
                if (_formKey.currentState!.validate()) {
                  ref
                      .read(tokenProvider.notifier)
                      .login(_emailController.text, _passwordController.text);
                }
              },
              child: Text(AppLocalizations.of(context)!.loginButton),
            )
          ],
        ));
  }
}

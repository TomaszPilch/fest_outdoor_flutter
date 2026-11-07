import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/providers/token_provider.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
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
  bool _showPassword = false;
  bool _submitting = false;

  bool get _canSubmit =>
      !_submitting &&
      _emailController.text.trim().isNotEmpty &&
      _passwordController.text.isNotEmpty;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_canSubmit || !_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    setState(() => _submitting = true);
    try {
      await ref
          .read(tokenProvider.notifier)
          .login(_emailController.text, _passwordController.text);
      if (mounted && ref.read(tokenProvider).value == null) {
        _showLoginError();
      }
    } catch (_) {
      if (mounted) _showLoginError();
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  void _showLoginError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.loginFailed)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AutofillGroup(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.username],
              controller: _emailController,
              enabled: !_submitting,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(labelText: l10n.usernameLabel),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return l10n.usernameRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.lg),
            TextFormField(
              controller: _passwordController,
              obscureText: !_showPassword,
              enabled: !_submitting,
              autocorrect: false,
              enableSuggestions: false,
              autofillHints: const [AutofillHints.password],
              textInputAction: TextInputAction.done,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: l10n.passwordLabel,
                suffixIcon: IconButton(
                  tooltip: _showPassword
                      ? l10n.hidePassword
                      : l10n.showPassword,
                  onPressed: _submitting
                      ? null
                      : () => setState(() => _showPassword = !_showPassword),
                  icon: Icon(
                    _showPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20,
                  ),
                ),
              ),
              onFieldSubmitted: (_) => _submit(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return l10n.passwordRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.xl),
            FilledButton.icon(
              onPressed: _canSubmit ? _submit : null,
              icon: _submitting
                  ? const SizedBox.square(
                      dimension: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.login, size: 20),
              label: Text(l10n.loginButton),
            ),
          ],
        ),
      ),
    );
  }
}

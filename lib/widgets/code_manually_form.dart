import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CodeManuallyForm extends StatefulWidget {
  const CodeManuallyForm({
    super.key,
    required this.onSubmit,
    required this.onCancel,
  });

  final Future<void> Function(String code) onSubmit;
  final VoidCallback onCancel;

  @override
  State<CodeManuallyForm> createState() => _CodeManuallyFormState();
}

class _CodeManuallyFormState extends State<CodeManuallyForm> {
  final TextEditingController _codeController = TextEditingController();
  bool _submitting = false;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final code = _codeController.text.trim();
    if (code.isEmpty || _submitting) return;
    setState(() => _submitting = true);
    try {
      await widget.onSubmit(code);
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final colors = AppThemeColors.of(context);
    final foreground = colors.onHeader;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadii.lg),
      borderSide: BorderSide(color: foreground.withValues(alpha: 0.25)),
    );

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: foreground.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            localizations.ticketCodeLabel,
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: foreground),
          ),
          const SizedBox(height: AppSpacing.sm),
          TextFormField(
            controller: _codeController,
            autofocus: true,
            enabled: !_submitting,
            autocorrect: false,
            enableSuggestions: false,
            textInputAction: TextInputAction.done,
            style: TextStyle(color: foreground, fontFamily: 'monospace'),
            cursorColor: colors.heroAccent,
            decoration: InputDecoration(
              hintText: '36K7M7KN',
              hintStyle: TextStyle(color: foreground.withValues(alpha: 0.4)),
              fillColor: foreground.withValues(alpha: 0.1),
              border: border,
              enabledBorder: border,
              focusedBorder: border.copyWith(
                borderSide: BorderSide(color: colors.heroAccent, width: 2),
              ),
            ),
            onChanged: (_) => setState(() {}),
            onFieldSubmitted: (_) => _submit(),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: foreground,
                    backgroundColor: Colors.transparent,
                    side: BorderSide(color: foreground.withValues(alpha: 0.25)),
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: _submitting ? null : widget.onCancel,
                  child: Text(localizations.cancel),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: colors.heroAccent,
                    foregroundColor: colors.heroForeground,
                    minimumSize: const Size.fromHeight(48),
                  ),
                  onPressed: _submitting || _codeController.text.trim().isEmpty
                      ? null
                      : _submit,
                  child: Text(localizations.checkTicket),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

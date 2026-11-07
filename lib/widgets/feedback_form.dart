import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/providers/feedback_provider.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedbackForm extends ConsumerStatefulWidget {
  const FeedbackForm({super.key});

  @override
  ConsumerState<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends ConsumerState<FeedbackForm> {
  final _nameController = TextEditingController();
  final _contentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int _rating = 0;
  bool _sent = false;
  bool _sending = false;
  bool _failed = false;

  @override
  void dispose() {
    _nameController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_sending || !_formKey.currentState!.validate()) return;
    setState(() {
      _sending = true;
      _failed = false;
    });
    try {
      await ref
          .read(feedbackProvider.notifier)
          .addFeedback(
            _nameController.text,
            _contentController.text,
            _rating * 10,
          );
      if (mounted) setState(() => _sent = true);
    } catch (_) {
      if (mounted) setState(() => _failed = true);
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final colors = AppThemeColors.of(context);
    if (_sent) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
        child: Column(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: colors.success.withValues(alpha: 0.12),
              child: Icon(Icons.check, size: 32, color: colors.success),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              l10n.thankYouForFeedback,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall,
            ),
          ],
        ),
      );
    }
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    l10n.ratingLabel,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      for (var i = 1; i <= 5; i++)
                        IconButton(
                          tooltip: l10n.starRating(i),
                          isSelected: i <= _rating,
                          icon: const Icon(Icons.star_border, size: 28),
                          selectedIcon: const Icon(Icons.star, size: 28),
                          color: i <= _rating
                              ? colors.warning
                              : theme.colorScheme.onSurfaceVariant,
                          onPressed: _sending
                              ? null
                              : () => setState(() => _rating = i),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          TextFormField(
            enabled: !_sending,
            controller: _nameController,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: l10n.nameLabel),
            validator: (value) => value == null || value.trim().isEmpty
                ? l10n.nameIsRequired
                : null,
          ),
          const SizedBox(height: AppSpacing.lg),
          TextFormField(
            enabled: !_sending,
            maxLines: 5,
            controller: _contentController,
            decoration: InputDecoration(
              labelText: l10n.contentLabel,
              alignLabelWithHint: true,
            ),
            validator: (value) => value == null || value.trim().isEmpty
                ? l10n.contentIsRequired
                : null,
          ),
          if (_failed) ...[
            const SizedBox(height: AppSpacing.md),
            Text(
              l10n.feedbackSendFailed,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.xl),
          FilledButton.icon(
            onPressed: _sending ? null : _submit,
            icon: _sending
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.send_outlined, size: 20),
            label: Text(_sending ? l10n.sendingFeedback : l10n.sendButton),
          ),
        ],
      ),
    );
  }
}

import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/widgets/feedback_form.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = AppThemeColors.of(context);
    final l10n = AppLocalizations.of(context)!;
    return SafeArea(
      top: false,
      bottom: false,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          AnnotatedRegion<SystemUiOverlayStyle>(
            value: AppTheme.headerOverlayStyle,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.xl,
                40 + MediaQuery.paddingOf(context).top,
                AppSpacing.xl,
                AppSpacing.xxl,
              ),
              color: colors.header,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.feedbackTitle,
                    style: theme.textTheme.headlineLarge!.copyWith(
                      color: colors.onHeader,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    l10n.feedbackTagline,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: colors.onHeader.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(AppSpacing.lg),
            child: FeedbackForm(),
          ),
        ],
      ),
    );
  }
}

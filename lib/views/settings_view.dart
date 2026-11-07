import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/providers/token_provider.dart';
import 'package:fest_outdoor/views/ticket_view.dart';
import 'package:fest_outdoor/widgets/login_form.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = AppThemeColors.of(context);
    final l10n = AppLocalizations.of(context)!;
    final token = ref.watch(tokenProvider);
    return Scaffold(
      body: SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            AnnotatedRegion<SystemUiOverlayStyle>(
              value: AppTheme.headerOverlayStyle,
              child: Container(
                color: colors.header,
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.xl,
                  MediaQuery.paddingOf(context).top + AppSpacing.sm,
                  AppSpacing.xl,
                  AppSpacing.xxl,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: const Offset(-AppSpacing.md, 0),
                      child: IconButton(
                        tooltip: MaterialLocalizations.of(
                          context,
                        ).backButtonTooltip,
                        onPressed: () => Navigator.of(context).maybePop(),
                        icon: const Icon(Icons.arrow_back),
                        color: colors.onHeader,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      token.value == null ? l10n.loginTitle : l10n.settings,
                      style: theme.textTheme.headlineLarge!.copyWith(
                        color: colors.onHeader,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      l10n.organizerAccess,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: colors.onHeader.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  token.when(
                    data: (value) => value == null
                        ? const LoginForm()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              FilledButton.icon(
                                onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const TicketView(),
                                  ),
                                ),
                                icon: const Icon(Icons.qr_code_scanner),
                                label: Text(l10n.goToTicketView),
                              ),
                              const SizedBox(height: AppSpacing.lg),
                              TextButton(
                                onPressed: () => ref
                                    .read(tokenProvider.notifier)
                                    .removeToken(),
                                child: Text(l10n.logout),
                              ),
                            ],
                          ),
                    loading: () => const Center(
                      child: SizedBox.square(
                        dimension: 32,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    error: (error, stackTrace) => Column(
                      children: [
                        Text(l10n.unableToLoadOrganizerAccess),
                        TextButton(
                          onPressed: () => ref.invalidate(tokenProvider),
                          child: Text(l10n.retry),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

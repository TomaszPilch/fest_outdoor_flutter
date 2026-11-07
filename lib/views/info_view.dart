import 'package:fest_outdoor/providers/guests_provider.dart';
import 'package:fest_outdoor/providers/info_provider.dart';
import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:fest_outdoor/utils/general.dart';
import 'package:fest_outdoor/widgets/content_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoView extends ConsumerWidget {
  const InfoView({super.key});

  Future<void> _openLink(BuildContext context, Uri uri) async {
    var opened = false;
    try {
      opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
    } on PlatformException {
      opened = false;
    }
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.unableToOpenLink)),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = AppThemeColors.of(context);
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final language = Localizations.localeOf(context).languageCode;
    final info = ref.watch(infoProvider(language));
    final guests = ref.watch(guestsProvider(language));
    final dates =
        '${DateFormat('d. M.', locale).format(conferenceDays.first)}'
        ' \u2013 ${DateFormat('d. M. yyyy', locale).format(conferenceDays.last)}';
    final weekdays =
        '${DateFormat('EEEE', locale).format(conferenceDays.first)}'
        ' \u2013 ${DateFormat('EEEE', locale).format(conferenceDays.last)}';

    return SafeArea(
      top: false,
      bottom: false,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          AnnotatedRegion<SystemUiOverlayStyle>(
            value: AppTheme.headerOverlayStyle,
            child: Container(
              color: colors.header,
              padding: EdgeInsets.fromLTRB(
                AppSpacing.xl,
                40 + MediaQuery.paddingOf(context).top,
                AppSpacing.xl,
                AppSpacing.xxl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.aboutFestival,
                    style: theme.textTheme.headlineLarge!.copyWith(
                      color: colors.onHeader,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    l10n.festivalTagline,
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
                _InfoFact(
                  icon: Icons.calendar_today_outlined,
                  title: dates,
                  subtitle: weekdays,
                ),
                const SizedBox(height: AppSpacing.sm),
                _InfoFact(
                  icon: Icons.location_on_outlined,
                  title: l10n.festivalVenue,
                  subtitle: 'Hr\u00e1dek 350, 739 97',
                ),
                if (guests case AsyncData(value: final values)) ...[
                  const SizedBox(height: AppSpacing.sm),
                  _InfoFact(
                    icon: Icons.people_outline,
                    title: l10n.festivalGuestCount(
                      values
                          .where((guest) => guest.title.trim().isNotEmpty)
                          .length,
                    ),
                    subtitle: l10n.festivalDayCount(conferenceDays.length),
                  ),
                ],
                const SizedBox(height: 20),
                _InfoSection(
                  title: l10n.whatIsFestival,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      switch (info) {
                        AsyncData(:final value) =>
                          value.isEmpty
                              ? Text(l10n.festivalDescription)
                              : ContentBlock(
                                  content: value,
                                  padding: EdgeInsets.zero,
                                ),
                        AsyncError() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(l10n.unableToLoadInfo),
                            TextButton(
                              onPressed: () =>
                                  ref.invalidate(infoProvider(language)),
                              child: Text(l10n.retry),
                            ),
                          ],
                        ),
                        _ => const Center(child: CircularProgressIndicator()),
                      },
                      const SizedBox(height: AppSpacing.lg),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _Extra(
                              icon: Icons.ac_unit,
                              label: l10n.coldWaterSwimming,
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            _Extra(
                              icon: Icons.restaurant_outlined,
                              label: l10n.foodAndDrink,
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            _Extra(
                              icon: Icons.celebration_outlined,
                              label: l10n.closingParty,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _InfoSection(
                  title: l10n.organizer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.festivalOrganizer),
                      const SizedBox(height: AppSpacing.sm),
                      TextButton.icon(
                        onPressed: () => _openLink(
                          context,
                          Uri.parse('mailto:pzkogrodek@gmail.com'),
                        ),
                        icon: const Icon(Icons.mail_outline, size: 16),
                        label: const Text('pzkogrodek@gmail.com'),
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/interreg_logo.png',
                  height: 100,
                  fit: BoxFit.contain,
                  semanticLabel: 'Interreg',
                ),
                const SizedBox(height: 20),
                FilledButton.icon(
                  onPressed: () => _openLink(
                    context,
                    Uri.parse('https://form.simpleshop.cz/xKaP9'),
                  ),
                  icon: const Icon(
                    Icons.confirmation_number_outlined,
                    size: 20,
                  ),
                  label: Text(l10n.buyTicket),
                  style: FilledButton.styleFrom(
                    textStyle: theme.textTheme.titleLarge,
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadii.xl),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoFact extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoFact({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(AppRadii.lg),
              ),
              child: Icon(icon, size: 20, color: theme.colorScheme.primary),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
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

class _InfoSection extends StatelessWidget {
  final String title;
  final Widget child;

  const _InfoSection({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: theme.textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.sm),
            DefaultTextStyle.merge(
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.625,
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class _Extra extends StatelessWidget {
  final IconData icon;
  final String label;

  const _Extra({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppThemeColors.of(context).muted,
          borderRadius: BorderRadius.circular(AppRadii.lg),
        ),
        child: Column(
          children: [
            Icon(icon, size: 20, color: theme.colorScheme.primary),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:fest_outdoor/models/ticket.dart';
import 'package:fest_outdoor/providers/ticket_detail_provider.dart'
    show ticketDetailProvider;
import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class TicketDetail extends ConsumerStatefulWidget {
  final String code;
  const TicketDetail({super.key, required this.code});

  @override
  ConsumerState<TicketDetail> createState() => _TicketDetailState();
}

class _TicketDetailState extends ConsumerState<TicketDetail> {
  bool _confirming = false;
  bool _confirmationFailed = false;

  Future<void> _confirmTicket() async {
    if (_confirming) return;
    setState(() {
      _confirming = true;
      _confirmationFailed = false;
    });
    try {
      await ref
          .read(ticketDetailProvider(widget.code).notifier)
          .confirmTicket();
    } catch (_) {
      if (mounted) setState(() => _confirmationFailed = true);
    } finally {
      if (mounted) setState(() => _confirming = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colors = AppThemeColors.of(context);
    final ticket = ref.watch(ticketDetailProvider(widget.code));

    return Scaffold(
      backgroundColor: colors.header,
      appBar: AppBar(
        foregroundColor: colors.onHeader,
        backgroundColor: colors.header,
        title: Text(localizations.goToTicketView),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppTheme.contentMaxWidth,
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.xl),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ...switch (ticket) {
                      AsyncData(:final value) => _ticketContent(context, value),
                      AsyncError(:final error) => [
                        Icon(
                          Icons.error_outline,
                          color: theme.colorScheme.error,
                          size: 32,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          localizations.unableToLoadTicket,
                          style: theme.textTheme.headlineSmall,
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        _detailRow(
                          localizations.codeLabel,
                          widget.code,
                          monospace: true,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        SelectableText(
                          error.toString(),
                          style: TextStyle(color: theme.colorScheme.error),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        OutlinedButton.icon(
                          onPressed: () =>
                              ref.invalidate(ticketDetailProvider(widget.code)),
                          icon: const Icon(Icons.refresh, size: 18),
                          label: Text(localizations.retry),
                        ),
                      ],
                      _ => [
                        _detailRow(
                          localizations.codeLabel,
                          widget.code,
                          monospace: true,
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        const Center(child: CircularProgressIndicator()),
                        const SizedBox(height: AppSpacing.xl),
                      ],
                    },
                    const SizedBox(height: AppSpacing.lg),
                    FilledButton.icon(
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                      ),
                      onPressed: _confirming
                          ? null
                          : () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.refresh, size: 18),
                      label: Text(localizations.scanNextTicket),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _ticketContent(BuildContext context, Ticket? ticket) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colors = AppThemeColors.of(context);
    final used = ticket?.logs?.isNotEmpty ?? false;
    final statusColor = ticket == null
        ? theme.colorScheme.error
        : used
        ? colors.warning
        : colors.success;
    final statusForeground = ticket == null
        ? theme.colorScheme.onError
        : used
        ? colors.onWarning
        : colors.onSuccess;
    final status = ticket == null
        ? localizations.invalidTicket
        : used
        ? localizations.usedTicket
        : localizations.validTicket;

    return [
      Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                ticket == null
                    ? Icons.cancel_outlined
                    : used
                    ? Icons.warning_amber_rounded
                    : Icons.check_circle_outline,
                color: statusForeground,
                size: 18,
              ),
              const SizedBox(width: AppSpacing.sm),
              Flexible(
                child: Text(
                  status,
                  style: theme.textTheme.titleSmall!.copyWith(
                    color: statusForeground,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: AppSpacing.lg),
      SelectableText(
        ticket?.name ?? localizations.ticketNotFound,
        style: theme.textTheme.headlineSmall,
      ),
      const SizedBox(height: AppSpacing.xl),
      _detailRow(localizations.codeLabel, widget.code, monospace: true),
      const SizedBox(height: AppSpacing.sm),
      _detailRow(localizations.emailLabel, ticket?.email ?? 'N/A'),
      const SizedBox(height: AppSpacing.sm),
      _detailRow(localizations.ticketPersonLabel, ticket?.person ?? 'N/A'),
      const SizedBox(height: AppSpacing.lg),
      Text(
        ticket == null
            ? localizations.invalidTicketNote
            : used
            ? localizations.usedTicketNote
            : localizations.validTicketNote,
        style: theme.textTheme.bodyMedium!.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      const SizedBox(height: AppSpacing.xl),
      Text(localizations.ticketLogs, style: theme.textTheme.titleSmall),
      const SizedBox(height: AppSpacing.sm),
      if (ticket?.logs?.isNotEmpty ?? false)
        for (final log in ticket!.logs!)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Text(
              localizations.ticketScanTime(
                DateFormat('dd.MM.yyyy HH:mm').format(log.scanTime),
              ),
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          )
      else
        Text(
          localizations.noTicketLogs,
          style: theme.textTheme.bodyMedium!.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      if (_confirmationFailed) ...[
        const SizedBox(height: AppSpacing.lg),
        Text(
          localizations.ticketConfirmationFailed,
          style: TextStyle(color: theme.colorScheme.error),
        ),
      ],
      if (ticket != null) ...[
        const SizedBox(height: AppSpacing.lg),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            foregroundColor: theme.colorScheme.primary,
            side: BorderSide(color: theme.colorScheme.primary),
            minimumSize: const Size.fromHeight(48),
          ),
          onPressed: _confirming ? null : _confirmTicket,
          icon: _confirming
              ? const SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.check_circle_outline, size: 18),
          label: Text(localizations.confirmTicket),
        ),
      ],
    ];
  }

  Widget _detailRow(String label, String value, {bool monospace = false}) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.lg),
        Expanded(
          flex: 3,
          child: SelectableText(
            value,
            textAlign: TextAlign.right,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontFamily: monospace ? 'monospace' : null,
            ),
          ),
        ),
      ],
    );
  }
}

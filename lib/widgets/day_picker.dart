import 'package:fest_outdoor/utils/general.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Days { first, second }

class DayPicker extends StatelessWidget {
  final TabController controller;
  final bool showWeekday;

  const DayPicker({
    super.key,
    required this.controller,
    this.showWeekday = false,
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (showWeekday) {
      final theme = Theme.of(context);
      return AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Row(
          children: [
            for (var index = 0; index < conferenceDays.length; index++) ...[
              if (index > 0) const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Builder(
                  builder: (context) {
                    final selected = controller.index == index;
                    final weekday = DateFormat(
                      'EEEE',
                      locale,
                    ).format(conferenceDays[index]);
                    final foreground = selected
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurfaceVariant;
                    return Semantics(
                      selected: selected,
                      child: TextButton(
                        onPressed: () => controller.animateTo(index),
                        style: TextButton.styleFrom(
                          backgroundColor: selected
                              ? theme.colorScheme.primary
                              : Colors.transparent,
                          foregroundColor: foreground,
                          minimumSize: const Size(0, 64),
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm,
                            vertical: AppSpacing.md,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppRadii.xl),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${weekday[0].toUpperCase()}${weekday.substring(1)}',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: foreground,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              DateFormat(
                                'd. M.',
                                locale,
                              ).format(conferenceDays[index]),
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: foreground.withValues(alpha: 0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      );
    }
    return TabBar(
      controller: controller,
      tabs: <Widget>[
        Tab(
          child: Text(DateFormat('d MMMM', locale).format(conferenceDays[0])),
        ),
        Tab(
          child: Text(DateFormat('d MMMM', locale).format(conferenceDays[1])),
        ),
      ],
    );
  }
}

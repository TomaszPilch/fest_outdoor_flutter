import 'package:fest_outdoor/models/guest.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:flutter/material.dart';

class GuestDetailHero extends StatelessWidget {
  final Guest guest;

  const GuestDetailHero({super.key, required this.guest});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final name = guest.name.trim().isEmpty ? guest.title : guest.name;
    final initials = name.trim().isEmpty
        ? '?'
        : name
              .trim()
              .split(RegExp(r'\s+'))
              .take(2)
              .map((word) => word.characters.first)
              .join()
              .toUpperCase();

    return Center(
      child: Hero(
        tag: "guest_photo_${guest.id}",
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.xs),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 64,
            backgroundColor: theme.colorScheme.secondary,
            backgroundImage: guest.image == null
                ? null
                : NetworkImage(
                    'https://cms-new.pzkogrodek.cz${guest.image!.url}',
                  ),
            child: guest.image == null
                ? Text(
                    initials,
                    style: theme.textTheme.headlineLarge!.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

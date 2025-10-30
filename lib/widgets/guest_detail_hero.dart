import 'package:fest_outdoor/models/guest.dart';
import 'package:flutter/material.dart';

class GuestDetailHero extends StatelessWidget {
  final Guest guest;

  const GuestDetailHero({super.key, required this.guest});

  @override
  Widget build(BuildContext context) {
    if (guest.image == null) {
      return const SizedBox.shrink();
    }

    return Center(
      child: Hero(
          tag: "guest_photo_${guest.id}",
          child: CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                  'https://cms-new.pzkogrodek.cz${guest.image!.url}'))),
    );
  }
}

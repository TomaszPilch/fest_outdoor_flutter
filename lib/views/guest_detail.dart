import 'package:fest_outdoor/models/guest.dart';
import 'package:fest_outdoor/widgets/content_block.dart';
import 'package:fest_outdoor/widgets/guest_detail_hero.dart';
import 'package:fest_outdoor/widgets/guest_detail_time_favorite.dart';
import 'package:flutter/material.dart';

class GuestDetail extends StatelessWidget {
  final Guest guest;

  const GuestDetail({super.key, required this.guest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          guest.attributes.title,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          GuestDetailHero(guest: guest),
          const SizedBox(
            height: 20,
          ),
          Text(
            guest.attributes.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          GuestDetailTimeFavorite(guest: guest),
          const SizedBox(
            height: 20,
          ),
          ContentBlock(content: guest.attributes.content),
        ],
      ),
    );
  }
}

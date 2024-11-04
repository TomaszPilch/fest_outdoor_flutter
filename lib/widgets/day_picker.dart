import 'package:fest_outdoor/utils/general.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Days { first, second }

class DayPicker extends StatelessWidget {
  final TabController controller;

  const DayPicker({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      indicatorColor: Theme.of(context).colorScheme.onSecondary,
      tabs: <Widget>[
        Tab(
          child: Text(
            DateFormat('d MMMM').format(conferenceDays[0]),
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
        Tab(
          child: Text(
            DateFormat('d MMMM').format(conferenceDays[1]),
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
      ],
    );
  }
}

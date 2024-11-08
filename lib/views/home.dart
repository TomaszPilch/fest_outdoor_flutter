import 'package:fest_outdoor/utils/general.dart';
import 'package:fest_outdoor/views/feedback_view.dart';
import 'package:fest_outdoor/views/guest_view.dart';
import 'package:fest_outdoor/views/info_view.dart';
import 'package:fest_outdoor/views/settings_view.dart';
import 'package:fest_outdoor/widgets/bottom_navigation.dart';
import 'package:fest_outdoor/widgets/day_picker.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int selectedIndex = 0;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget renderBody() {
    switch (selectedIndex) {
      case 0:
      case 1:
        return TabBarView(
          controller: _tabController,
          children: [
            GuestView(
                day: conferenceDays[0], onlyFavorites: selectedIndex == 1),
            GuestView(
                day: conferenceDays[1], onlyFavorites: selectedIndex == 1),
          ],
        );
      case 2:
        return const InfoView();
      case 3:
        return const FeedbackView();
      default:
        return const Placeholder();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Center(
            child: Text(
              '🧗 Fest Outdoor 2024 🪂',
              style:
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
          bottom: selectedIndex < 2
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: Center(
                      child: DayPicker(
                    controller: _tabController,
                  )),
                )
              : null,
        ),
        body: renderBody(),
        floatingActionButton: selectedIndex == 3
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SettingsView()));
                },
                child: const Icon(Icons.settings_outlined),
              )
            : null,
        bottomNavigationBar: BottomNavigation(
          selectedIndex: selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ));
  }
}

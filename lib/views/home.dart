import 'package:fest_outdoor/utils/general.dart';
import 'package:fest_outdoor/views/feedback_view.dart';
import 'package:fest_outdoor/views/favorites_view.dart';
import 'package:fest_outdoor/views/guest_view.dart';
import 'package:fest_outdoor/views/info_view.dart';
import 'package:fest_outdoor/views/settings_view.dart';
import 'package:fest_outdoor/widgets/bottom_navigation.dart';
import 'package:fest_outdoor/widgets/day_picker.dart';
import 'package:fest_outdoor/widgets/festival_hero.dart';
import 'package:fest_outdoor/theme/app_theme.dart';
import 'package:fest_outdoor/src/generated/i18n/app_localizations.dart';
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
        return TabBarView(
          controller: _tabController,
          children: [
            GuestView(day: conferenceDays[0]),
            GuestView(day: conferenceDays[1]),
          ],
        );
      case 1:
        return FavoritesView(
          onBrowseProgram: () => setState(() => selectedIndex = 0),
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
      body: selectedIndex == 0
          ? SafeArea(
              top: false,
              bottom: false,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  const SliverToBoxAdapter(child: FestivalHero()),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                        vertical: AppSpacing.sm,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Transform.translate(
                            offset: const Offset(0, -AppSpacing.sm),
                            child: Card(
                              margin: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  AppRadii.xxl,
                                ),
                                side: BorderSide(
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6),
                                child: DayPicker(
                                  controller: _tabController,
                                  showWeekday: true,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 20,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: Text(
                                  AppLocalizations.of(context)!.festivalVenue,
                                  style: Theme.of(context).textTheme.bodyMedium!
                                      .copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurfaceVariant,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.sm),
                        ],
                      ),
                    ),
                  ),
                ],
                body: renderBody(),
              ),
            )
          : renderBody(),
      floatingActionButton: selectedIndex == 3
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SettingsView()),
                );
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
      ),
    );
  }
}

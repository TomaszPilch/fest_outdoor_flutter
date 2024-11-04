import 'package:fest_outdoor/models/guest.dart';
import 'package:fest_outdoor/providers/guests_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guests_day_provider.g.dart';

@riverpod
Future<List<Guest>> guestsDay(Ref ref, DateTime day, String locale) async {
  final allGuests = ref.watch(guestsProvider(locale));

  return allGuests.when(
    data: (value) => value
        .where((element) => element.attributes.start.day == day.day)
        .toList(),
    loading: () => [],
    error: (error, stack) => throw error,
  );
}

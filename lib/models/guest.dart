import 'package:fest_outdoor/models/image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'guest.freezed.dart';
part 'guest.g.dart';

@freezed
abstract class Guest with _$Guest {
  const Guest._();

  const factory Guest({
    required int id,
    @Default('') String name,
    @Default('') String title,
    required DateTime start,
    required DateTime end,
    required String description,
    required List<Map<String, dynamic>> content,
    Image? image,
  }) = _Guest;

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);

  String get startEnd =>
      '${DateFormat('HH:mm').format(start.toLocal())} - ${DateFormat('HH:mm').format(end.toLocal())}';

  String get startDay => DateFormat('dd.MM.yyyy').format(start.toLocal());
}

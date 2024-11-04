import 'package:fest_outdoor/models/guest_attributes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'guest.freezed.dart';
part 'guest.g.dart';

@freezed
class Guest with _$Guest {
  const Guest._();

  const factory Guest({
    required int id,
    required GuestAttributes attributes,
  }) = _Guest;

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);

  String get startEnd =>
      '${DateFormat('HH:mm').format(attributes.start)} - ${DateFormat('HH:mm').format(attributes.end)}';

  String get startDay => DateFormat('dd.MM.yyyy').format(attributes.start);
}

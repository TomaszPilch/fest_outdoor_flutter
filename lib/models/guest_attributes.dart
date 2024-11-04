import 'package:fest_outdoor/models/image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest_attributes.freezed.dart';
part 'guest_attributes.g.dart';

@freezed
class GuestAttributes with _$GuestAttributes {
  const factory GuestAttributes({
    required String title,
    required DateTime start,
    required DateTime end,
    required String description,
    required List<Map<String, dynamic>> content,
    Image? image,
  }) = _GuestAttributes;

  factory GuestAttributes.fromJson(Map<String, dynamic> json) =>
      _$GuestAttributesFromJson(json);
}

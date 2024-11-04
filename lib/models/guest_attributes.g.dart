// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuestAttributesImpl _$$GuestAttributesImplFromJson(
        Map<String, dynamic> json) =>
    _$GuestAttributesImpl(
      title: json['title'] as String,
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
      description: json['description'] as String,
      content: (json['content'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GuestAttributesImplToJson(
        _$GuestAttributesImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'start': instance.start.toIso8601String(),
      'end': instance.end.toIso8601String(),
      'description': instance.description,
      'content': instance.content,
      'image': instance.image,
    };

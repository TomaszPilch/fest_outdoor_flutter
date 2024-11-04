// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuestImpl _$$GuestImplFromJson(Map<String, dynamic> json) => _$GuestImpl(
      id: (json['id'] as num).toInt(),
      attributes:
          GuestAttributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GuestImplToJson(_$GuestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketLogImpl _$$TicketLogImplFromJson(Map<String, dynamic> json) =>
    _$TicketLogImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      scanTime: DateTime.parse(json['scanTime'] as String),
    );

Map<String, dynamic> _$$TicketLogImplToJson(_$TicketLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'scanTime': instance.scanTime.toIso8601String(),
    };

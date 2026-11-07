// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketLog _$TicketLogFromJson(Map<String, dynamic> json) => _TicketLog(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String,
  scanTime: DateTime.parse(json['scanTime'] as String),
);

Map<String, dynamic> _$TicketLogToJson(_TicketLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'scanTime': instance.scanTime.toIso8601String(),
    };

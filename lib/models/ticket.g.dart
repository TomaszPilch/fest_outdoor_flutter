// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ticket _$TicketFromJson(Map<String, dynamic> json) => _Ticket(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      person: json['person'] as String?,
      logs: (json['logs'] as List<dynamic>?)
          ?.map((e) => TicketLog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketToJson(_Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'email': instance.email,
      'person': instance.person,
      'logs': instance.logs,
    };

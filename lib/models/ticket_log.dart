import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_log.freezed.dart';
part 'ticket_log.g.dart';

@freezed
class TicketLog with _$TicketLog {
  const factory TicketLog({
    required int id,
    required String code,
    required DateTime scanTime,
  }) = _TicketLog;

  factory TicketLog.fromJson(Map<String, dynamic> json) =>
      _$TicketLogFromJson(json);
}

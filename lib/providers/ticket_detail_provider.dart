import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fest_outdoor/models/ticket.dart';
import 'package:fest_outdoor/models/ticket_log.dart';
import 'package:fest_outdoor/providers/token_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticket_detail_provider.g.dart';

final dio = Dio();

@riverpod
class TicketDetail extends _$TicketDetail {
  @override
  Future<Ticket?> build(String code) async {
    final token = await ref.watch(tokenProvider.future);
    final response = await dio.get(
        'https://cms.pzkogrodek.cz/api/fest-outdoor-tickets?filters[code][\$eq]=${code.toUpperCase()}',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        ));

    if (response.data?['data'] == null || response.data?['data'].isEmpty) {
      return null;
    }

    final ticketDetail = response.data?['data']?[0];
    ticketDetail['attributes']['id'] = ticketDetail['id'];
    Ticket ticket = Ticket.fromJson(ticketDetail['attributes']);

    final responseLogs = await dio.get(
        'https://cms.pzkogrodek.cz/api/fest-outdoor-tickets-logs?populate=fest_outdoor_ticket&filters[fest_outdoor_ticket][id][\$eq]=${ticket.id}',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        ));

    final List<dynamic>? ticketLogs = responseLogs.data?['data'];
    if (ticketLogs != null && ticketLogs.isNotEmpty) {
      ticket = ticket.copyWith(
          logs: ticketLogs.map<TicketLog>((log) {
        log['attributes']['id'] = log['id'];
        return TicketLog.fromJson(log['attributes']);
      }).toList());
    }

    return ticket;
  }

  Future<void> confirmTicket() async {
    final previousState = await future;

    if (previousState == null) {
      return;
    }

    final token = await ref.watch(tokenProvider.future);
    await dio.post('https://cms.pzkogrodek.cz/api/fest-outdoor-tickets-logs',
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
        ),
        data: {
          'data': {
            'fest_outdoor_ticket': previousState.id,
            'code': previousState.code,
            'scanTime': DateTime.now().toIso8601String(),
          }
        });

    ref.invalidateSelf();
  }
}

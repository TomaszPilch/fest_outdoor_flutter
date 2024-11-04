import 'package:dio/dio.dart';
import 'package:fest_outdoor/models/guest.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guests_provider.g.dart';

final dio = Dio();

@riverpod
Future<List<Guest>> guests(Ref ref, String locale) async {
  final response = await dio.get(
      'https://cms.pzkogrodek.cz/api/fest-outdoor-guests?populate=image&locale=$locale');

  return (response.data['data'] as List).map<Guest>((e) {
    if (e['attributes']?['image']?['data']?['attributes']?['formats']
            ?['thumbnail'] !=
        null) {
      e['attributes']['image'] = e['attributes']?['image']?['data']
          ?['attributes']?['formats']?['thumbnail'];
    } else {
      e['attributes']['image'] = null;
    }
    return Guest.fromJson(e as Map<String, dynamic>);
  }).toList();
}

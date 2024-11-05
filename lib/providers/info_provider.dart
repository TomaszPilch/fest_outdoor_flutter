import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'info_provider.g.dart';

final dio = Dio();

@riverpod
Future<List<dynamic>> info(Ref ref, String locale) async {
  final response = await dio
      .get('https://cms.pzkogrodek.cz/api/fest-outdoor-info?locale=$locale');
  return (response.data?['data']?['attributes']?['content'] ?? [])
      as List<dynamic>;
}

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_provider.g.dart';

final dio = Dio();

@riverpod
class Feedback extends _$Feedback {
  @override
  Future<List<String>> build() async {
    return [];
  }

  Future<void> addFeedback(String name, String content, int rating) async {
    await dio
        .post('https://cms.pzkogrodek.cz/api/fest-outdoor-feedbacks', data: {
      'data': {
        'name': name,
        'content': content,
        'rating': rating,
      }
    });
  }
}

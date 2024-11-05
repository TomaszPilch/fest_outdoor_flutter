import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_provider.g.dart';

@riverpod
class Feedback extends _$Feedback {
  @override
  Future<List<String>> build() async {
    return [];
  }

  Future<void> addFeedback(String feedback) async {
    // todo
  }
}

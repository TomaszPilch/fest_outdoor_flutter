// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Feedback)
const feedbackProvider = FeedbackProvider._();

final class FeedbackProvider
    extends $AsyncNotifierProvider<Feedback, List<String>> {
  const FeedbackProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'feedbackProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$feedbackHash();

  @$internal
  @override
  Feedback create() => Feedback();
}

String _$feedbackHash() => r'efc004457bb72f13d45a239fc6a84e917a7457ca';

abstract class _$Feedback extends $AsyncNotifier<List<String>> {
  FutureOr<List<String>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<String>>, List<String>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<String>>, List<String>>,
        AsyncValue<List<String>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

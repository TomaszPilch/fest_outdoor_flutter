// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Feedback)
final feedbackProvider = FeedbackProvider._();

final class FeedbackProvider
    extends $AsyncNotifierProvider<Feedback, List<String>> {
  FeedbackProvider._()
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

String _$feedbackHash() => r'84f611403fb6160279fa114d760819239d5f2dc6';

abstract class _$Feedback extends $AsyncNotifier<List<String>> {
  FutureOr<List<String>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<String>>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<String>>, List<String>>,
              AsyncValue<List<String>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

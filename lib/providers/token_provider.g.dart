// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Token)
const tokenProvider = TokenProvider._();

final class TokenProvider extends $AsyncNotifierProvider<Token, String?> {
  const TokenProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tokenProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tokenHash();

  @$internal
  @override
  Token create() => Token();
}

String _$tokenHash() => r'1228d14020f4046d38d45a0e96dbfcf57cdc4374';

abstract class _$Token extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<String?>, String?>,
        AsyncValue<String?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

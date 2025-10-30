// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(info)
const infoProvider = InfoFamily._();

final class InfoProvider extends $FunctionalProvider<AsyncValue<List<dynamic>>,
        List<dynamic>, FutureOr<List<dynamic>>>
    with $FutureModifier<List<dynamic>>, $FutureProvider<List<dynamic>> {
  const InfoProvider._(
      {required InfoFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'infoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$infoHash();

  @override
  String toString() {
    return r'infoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<dynamic>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<dynamic>> create(Ref ref) {
    final argument = this.argument as String;
    return info(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is InfoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$infoHash() => r'c8954f4ac0b40d3ca999f7c69368a75c3b499c5c';

final class InfoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<dynamic>>, String> {
  const InfoFamily._()
      : super(
          retry: null,
          name: r'infoProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  InfoProvider call(
    String locale,
  ) =>
      InfoProvider._(argument: locale, from: this);

  @override
  String toString() => r'infoProvider';
}

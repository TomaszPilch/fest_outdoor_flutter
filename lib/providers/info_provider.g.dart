// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(info)
final infoProvider = InfoFamily._();

final class InfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<dynamic>>,
          List<dynamic>,
          FutureOr<List<dynamic>>
        >
    with $FutureModifier<List<dynamic>>, $FutureProvider<List<dynamic>> {
  InfoProvider._({
    required InfoFamily super.from,
    required String super.argument,
  }) : super(
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
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<dynamic>> create(Ref ref) {
    final argument = this.argument as String;
    return info(ref, argument);
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

String _$infoHash() => r'ec0bc94e79416bfec095e068131f9f5b00de13d6';

final class InfoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<dynamic>>, String> {
  InfoFamily._()
    : super(
        retry: null,
        name: r'infoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InfoProvider call(String locale) =>
      InfoProvider._(argument: locale, from: this);

  @override
  String toString() => r'infoProvider';
}

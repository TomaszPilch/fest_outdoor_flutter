// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guests_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(guests)
final guestsProvider = GuestsFamily._();

final class GuestsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Guest>>,
          List<Guest>,
          FutureOr<List<Guest>>
        >
    with $FutureModifier<List<Guest>>, $FutureProvider<List<Guest>> {
  GuestsProvider._({
    required GuestsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'guestsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$guestsHash();

  @override
  String toString() {
    return r'guestsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Guest>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Guest>> create(Ref ref) {
    final argument = this.argument as String;
    return guests(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GuestsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$guestsHash() => r'c4bf64a37e8e78273f1870cbaeda3df95c52c315';

final class GuestsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Guest>>, String> {
  GuestsFamily._()
    : super(
        retry: null,
        name: r'guestsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GuestsProvider call(String locale) =>
      GuestsProvider._(argument: locale, from: this);

  @override
  String toString() => r'guestsProvider';
}

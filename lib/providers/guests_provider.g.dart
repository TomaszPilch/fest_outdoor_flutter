// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guests_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(guests)
const guestsProvider = GuestsFamily._();

final class GuestsProvider extends $FunctionalProvider<AsyncValue<List<Guest>>,
        List<Guest>, FutureOr<List<Guest>>>
    with $FutureModifier<List<Guest>>, $FutureProvider<List<Guest>> {
  const GuestsProvider._(
      {required GuestsFamily super.from, required String super.argument})
      : super(
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
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Guest>> create(Ref ref) {
    final argument = this.argument as String;
    return guests(
      ref,
      argument,
    );
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

String _$guestsHash() => r'434ea7e89feb94f6e8cd5110c9e44a90b95fec29';

final class GuestsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Guest>>, String> {
  const GuestsFamily._()
      : super(
          retry: null,
          name: r'guestsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  GuestsProvider call(
    String locale,
  ) =>
      GuestsProvider._(argument: locale, from: this);

  @override
  String toString() => r'guestsProvider';
}

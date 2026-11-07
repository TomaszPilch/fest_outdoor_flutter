// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guests_day_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(guestsDay)
final guestsDayProvider = GuestsDayFamily._();

final class GuestsDayProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Guest>>,
          List<Guest>,
          FutureOr<List<Guest>>
        >
    with $FutureModifier<List<Guest>>, $FutureProvider<List<Guest>> {
  GuestsDayProvider._({
    required GuestsDayFamily super.from,
    required (DateTime, String) super.argument,
  }) : super(
         retry: null,
         name: r'guestsDayProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$guestsDayHash();

  @override
  String toString() {
    return r'guestsDayProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<Guest>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Guest>> create(Ref ref) {
    final argument = this.argument as (DateTime, String);
    return guestsDay(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is GuestsDayProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$guestsDayHash() => r'ff54b6b2d8eef792968bef7d8b5bd1562dbd9653';

final class GuestsDayFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Guest>>, (DateTime, String)> {
  GuestsDayFamily._()
    : super(
        retry: null,
        name: r'guestsDayProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GuestsDayProvider call(DateTime day, String locale) =>
      GuestsDayProvider._(argument: (day, locale), from: this);

  @override
  String toString() => r'guestsDayProvider';
}

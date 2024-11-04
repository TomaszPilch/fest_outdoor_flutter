// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guests_day_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$guestsDayHash() => r'390dfcb8fe1a113cbf371310cb13daaecce6b446';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [guestsDay].
@ProviderFor(guestsDay)
const guestsDayProvider = GuestsDayFamily();

/// See also [guestsDay].
class GuestsDayFamily extends Family<AsyncValue<List<Guest>>> {
  /// See also [guestsDay].
  const GuestsDayFamily();

  /// See also [guestsDay].
  GuestsDayProvider call(
    DateTime day,
    String locale,
  ) {
    return GuestsDayProvider(
      day,
      locale,
    );
  }

  @override
  GuestsDayProvider getProviderOverride(
    covariant GuestsDayProvider provider,
  ) {
    return call(
      provider.day,
      provider.locale,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'guestsDayProvider';
}

/// See also [guestsDay].
class GuestsDayProvider extends AutoDisposeFutureProvider<List<Guest>> {
  /// See also [guestsDay].
  GuestsDayProvider(
    DateTime day,
    String locale,
  ) : this._internal(
          (ref) => guestsDay(
            ref as GuestsDayRef,
            day,
            locale,
          ),
          from: guestsDayProvider,
          name: r'guestsDayProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$guestsDayHash,
          dependencies: GuestsDayFamily._dependencies,
          allTransitiveDependencies: GuestsDayFamily._allTransitiveDependencies,
          day: day,
          locale: locale,
        );

  GuestsDayProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.day,
    required this.locale,
  }) : super.internal();

  final DateTime day;
  final String locale;

  @override
  Override overrideWith(
    FutureOr<List<Guest>> Function(GuestsDayRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GuestsDayProvider._internal(
        (ref) => create(ref as GuestsDayRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        day: day,
        locale: locale,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Guest>> createElement() {
    return _GuestsDayProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GuestsDayProvider &&
        other.day == day &&
        other.locale == locale;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, day.hashCode);
    hash = _SystemHash.combine(hash, locale.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GuestsDayRef on AutoDisposeFutureProviderRef<List<Guest>> {
  /// The parameter `day` of this provider.
  DateTime get day;

  /// The parameter `locale` of this provider.
  String get locale;
}

class _GuestsDayProviderElement
    extends AutoDisposeFutureProviderElement<List<Guest>> with GuestsDayRef {
  _GuestsDayProviderElement(super.provider);

  @override
  DateTime get day => (origin as GuestsDayProvider).day;
  @override
  String get locale => (origin as GuestsDayProvider).locale;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

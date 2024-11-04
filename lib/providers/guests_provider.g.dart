// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guests_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$guestsHash() => r'8029cbed0a9e8bd31365a1caad23ab2a88327bc7';

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

/// See also [guests].
@ProviderFor(guests)
const guestsProvider = GuestsFamily();

/// See also [guests].
class GuestsFamily extends Family<AsyncValue<List<Guest>>> {
  /// See also [guests].
  const GuestsFamily();

  /// See also [guests].
  GuestsProvider call(
    String locale,
  ) {
    return GuestsProvider(
      locale,
    );
  }

  @override
  GuestsProvider getProviderOverride(
    covariant GuestsProvider provider,
  ) {
    return call(
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
  String? get name => r'guestsProvider';
}

/// See also [guests].
class GuestsProvider extends AutoDisposeFutureProvider<List<Guest>> {
  /// See also [guests].
  GuestsProvider(
    String locale,
  ) : this._internal(
          (ref) => guests(
            ref as GuestsRef,
            locale,
          ),
          from: guestsProvider,
          name: r'guestsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$guestsHash,
          dependencies: GuestsFamily._dependencies,
          allTransitiveDependencies: GuestsFamily._allTransitiveDependencies,
          locale: locale,
        );

  GuestsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.locale,
  }) : super.internal();

  final String locale;

  @override
  Override overrideWith(
    FutureOr<List<Guest>> Function(GuestsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GuestsProvider._internal(
        (ref) => create(ref as GuestsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        locale: locale,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Guest>> createElement() {
    return _GuestsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GuestsProvider && other.locale == locale;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, locale.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GuestsRef on AutoDisposeFutureProviderRef<List<Guest>> {
  /// The parameter `locale` of this provider.
  String get locale;
}

class _GuestsProviderElement
    extends AutoDisposeFutureProviderElement<List<Guest>> with GuestsRef {
  _GuestsProviderElement(super.provider);

  @override
  String get locale => (origin as GuestsProvider).locale;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

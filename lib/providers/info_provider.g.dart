// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$infoHash() => r'c8954f4ac0b40d3ca999f7c69368a75c3b499c5c';

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

/// See also [info].
@ProviderFor(info)
const infoProvider = InfoFamily();

/// See also [info].
class InfoFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [info].
  const InfoFamily();

  /// See also [info].
  InfoProvider call(
    String locale,
  ) {
    return InfoProvider(
      locale,
    );
  }

  @override
  InfoProvider getProviderOverride(
    covariant InfoProvider provider,
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
  String? get name => r'infoProvider';
}

/// See also [info].
class InfoProvider extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [info].
  InfoProvider(
    String locale,
  ) : this._internal(
          (ref) => info(
            ref as InfoRef,
            locale,
          ),
          from: infoProvider,
          name: r'infoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$infoHash,
          dependencies: InfoFamily._dependencies,
          allTransitiveDependencies: InfoFamily._allTransitiveDependencies,
          locale: locale,
        );

  InfoProvider._internal(
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
    FutureOr<List<dynamic>> Function(InfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InfoProvider._internal(
        (ref) => create(ref as InfoRef),
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
  AutoDisposeFutureProviderElement<List<dynamic>> createElement() {
    return _InfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InfoProvider && other.locale == locale;
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
mixin InfoRef on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `locale` of this provider.
  String get locale;
}

class _InfoProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>> with InfoRef {
  _InfoProviderElement(super.provider);

  @override
  String get locale => (origin as InfoProvider).locale;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

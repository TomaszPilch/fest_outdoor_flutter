// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ticketDetailHash() => r'c8dca1938674235a20a916209eb407f2bcf55391';

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

abstract class _$TicketDetail
    extends BuildlessAutoDisposeAsyncNotifier<Ticket?> {
  late final String code;

  FutureOr<Ticket?> build(
    String code,
  );
}

/// See also [TicketDetail].
@ProviderFor(TicketDetail)
const ticketDetailProvider = TicketDetailFamily();

/// See also [TicketDetail].
class TicketDetailFamily extends Family<AsyncValue<Ticket?>> {
  /// See also [TicketDetail].
  const TicketDetailFamily();

  /// See also [TicketDetail].
  TicketDetailProvider call(
    String code,
  ) {
    return TicketDetailProvider(
      code,
    );
  }

  @override
  TicketDetailProvider getProviderOverride(
    covariant TicketDetailProvider provider,
  ) {
    return call(
      provider.code,
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
  String? get name => r'ticketDetailProvider';
}

/// See also [TicketDetail].
class TicketDetailProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TicketDetail, Ticket?> {
  /// See also [TicketDetail].
  TicketDetailProvider(
    String code,
  ) : this._internal(
          () => TicketDetail()..code = code,
          from: ticketDetailProvider,
          name: r'ticketDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ticketDetailHash,
          dependencies: TicketDetailFamily._dependencies,
          allTransitiveDependencies:
              TicketDetailFamily._allTransitiveDependencies,
          code: code,
        );

  TicketDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.code,
  }) : super.internal();

  final String code;

  @override
  FutureOr<Ticket?> runNotifierBuild(
    covariant TicketDetail notifier,
  ) {
    return notifier.build(
      code,
    );
  }

  @override
  Override overrideWith(TicketDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: TicketDetailProvider._internal(
        () => create()..code = code,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        code: code,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TicketDetail, Ticket?>
      createElement() {
    return _TicketDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TicketDetailProvider && other.code == code;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, code.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TicketDetailRef on AutoDisposeAsyncNotifierProviderRef<Ticket?> {
  /// The parameter `code` of this provider.
  String get code;
}

class _TicketDetailProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TicketDetail, Ticket?>
    with TicketDetailRef {
  _TicketDetailProviderElement(super.provider);

  @override
  String get code => (origin as TicketDetailProvider).code;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TicketDetail)
const ticketDetailProvider = TicketDetailFamily._();

final class TicketDetailProvider
    extends $AsyncNotifierProvider<TicketDetail, Ticket?> {
  const TicketDetailProvider._(
      {required TicketDetailFamily super.from, required String super.argument})
      : super(
          retry: null,
          name: r'ticketDetailProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$ticketDetailHash();

  @override
  String toString() {
    return r'ticketDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TicketDetail create() => TicketDetail();

  @override
  bool operator ==(Object other) {
    return other is TicketDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ticketDetailHash() => r'c8dca1938674235a20a916209eb407f2bcf55391';

final class TicketDetailFamily extends $Family
    with
        $ClassFamilyOverride<TicketDetail, AsyncValue<Ticket?>, Ticket?,
            FutureOr<Ticket?>, String> {
  const TicketDetailFamily._()
      : super(
          retry: null,
          name: r'ticketDetailProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  TicketDetailProvider call(
    String code,
  ) =>
      TicketDetailProvider._(argument: code, from: this);

  @override
  String toString() => r'ticketDetailProvider';
}

abstract class _$TicketDetail extends $AsyncNotifier<Ticket?> {
  late final _$args = ref.$arg as String;
  String get code => _$args;

  FutureOr<Ticket?> build(
    String code,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<AsyncValue<Ticket?>, Ticket?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<Ticket?>, Ticket?>,
        AsyncValue<Ticket?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

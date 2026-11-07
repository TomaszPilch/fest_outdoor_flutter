// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guests_favorites_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GuestsFavorites)
final guestsFavoritesProvider = GuestsFavoritesProvider._();

final class GuestsFavoritesProvider
    extends $AsyncNotifierProvider<GuestsFavorites, List<int>> {
  GuestsFavoritesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'guestsFavoritesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$guestsFavoritesHash();

  @$internal
  @override
  GuestsFavorites create() => GuestsFavorites();
}

String _$guestsFavoritesHash() => r'b5dec07945461204ae799a0f73968830da2d7ac7';

abstract class _$GuestsFavorites extends $AsyncNotifier<List<int>> {
  FutureOr<List<int>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<int>>, List<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<int>>, List<int>>,
              AsyncValue<List<int>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

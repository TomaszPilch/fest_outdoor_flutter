import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'guests_favorites_provider.g.dart';

@riverpod
class GuestsFavorites extends _$GuestsFavorites {
  @override
  Future<List<int>> build() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorites') ?? [];

    return favorites.map((e) => int.parse(e)).toList();
  }

  Future<void> addFavourite(int id) async {
    final previousState = await future;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final newFavorites = [...previousState, id];

    await prefs.setStringList(
        'favorites', newFavorites.map((e) => e.toString()).toList());

    state = AsyncData(newFavorites);
  }

  Future<void> removeFavourite(int id) async {
    final previousState = await future;
    final newFavorites =
        previousState.where((element) => element != id).toList();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'favorites', newFavorites.map((e) => e.toString()).toList());

    state = AsyncData(newFavorites);
  }

  Future<void> toggleFavorite(int id) async {
    final previousState = await future;
    final newFavorites = previousState.contains(id)
        ? previousState.where((element) => element != id).toList()
        : [...previousState, id];

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'favorites', newFavorites.map((e) => e.toString()).toList());

    state = AsyncData(newFavorites);
  }
}

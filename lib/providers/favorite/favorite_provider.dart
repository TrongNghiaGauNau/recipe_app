import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoriteStateNotifier extends StateNotifier<List<String>>{
  FavoriteStateNotifier():super([]);

  addToFavorite(String idMeal){

  }
}

final favoriteStateProvider =
StateNotifierProvider<FavoriteStateNotifier, >((ref) {
  return FavoriteStateNotifier();
});

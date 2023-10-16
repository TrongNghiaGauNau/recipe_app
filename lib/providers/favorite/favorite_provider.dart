import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/model/meal_detail.dart';
import 'package:recipe_food_app/providers/favorite/favorite_state.dart';

class FavoriteStateNotifier extends StateNotifier<FavoriteState> {
  FavoriteStateNotifier() : super(const FavoriteState());

  addToFavorite(Meals meal) {
    state = state.copyWith(favoriteProducts: List.from(state.favoriteProducts)..add(meal),);
  }

  removeFromFavorite(Meals meal) {
    state = state.copyWith(favoriteProducts: List.from(state.favoriteProducts)..remove(meal),);
  }
}

final favoriteStateProvider =
    StateNotifierProvider<FavoriteStateNotifier, FavoriteState>((ref) {
  return FavoriteStateNotifier();
});

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/model/meal_detail.dart';
import 'package:recipe_food_app/providers/favorite/favorite_state.dart';

class FavoriteStateNotifier extends StateNotifier<FavoriteState> {
  FavoriteStateNotifier() : super(const FavoriteState()) {
    getFavoriteMeals();
  }

  final Box<Meals> favoriteMealsBox = Hive.box<Meals>(
    'favorite_meals',
  );

  getFavoriteMeals() {
    final mealsList = favoriteMealsBox.values.toList();
    state = state.copyWith(favoriteProducts: List<Meals>.from(mealsList));
  }

  addToFavorite(Meals meal) async {
    state = state.copyWith(
      favoriteProducts: List.from(state.favoriteProducts)..add(meal),
    );
    await favoriteMealsBox.put(meal.idMeal, meal);
  }

  removeFromFavorite(Meals meal) async {
    state = state.copyWith(
      favoriteProducts: List.from(state.favoriteProducts)..remove(meal),
    );
    await favoriteMealsBox.delete(meal.idMeal);
  }
}

final favoriteStateProvider =
    StateNotifierProvider<FavoriteStateNotifier, FavoriteState>((ref) {
  return FavoriteStateNotifier();
});

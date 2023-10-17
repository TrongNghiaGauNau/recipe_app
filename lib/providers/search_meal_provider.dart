import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/model/meal.dart';
import 'package:recipe_food_app/model/meal_detail.dart';
import '../repository/meal_api.dart';

class SearchStateNotifier extends StateNotifier<List<Meals>> {
  SearchStateNotifier() : super([]);

  searchMeal(String input) async {
    final List<Meals> listMeals = await MealRepository().searchMeal(input);
    state = listMeals;
  }
}


final searchMealsProvider =
StateNotifierProvider<SearchStateNotifier, List<Meals>>((ref) {
  return SearchStateNotifier();
});

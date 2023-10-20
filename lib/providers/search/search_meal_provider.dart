import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/model/meal_detail.dart';
import 'package:recipe_food_app/providers/search/search_state.dart';
import '../../repository/meal_api.dart';

class SearchStateNotifier extends StateNotifier<SearchState> {
  SearchStateNotifier() : super(const SearchState());

  searchMeal(String input) async {
    state = state.copyWith(isLoading: true);
    final List<Meals> listMeals = await MealRepository().searchMeal(input);
    state = state.copyWith(isLoading: false,searchList: listMeals);
  }
}


final searchMealsProvider =
StateNotifierProvider<SearchStateNotifier,SearchState>((ref) {
  return SearchStateNotifier();
});

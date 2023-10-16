import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/model/meal_detail.dart';
import 'package:recipe_food_app/repository/meal_api.dart';

final geMealDetailProvider =
    FutureProvider.family<Meals, String>((ref, idMeal) async {
  final detailMeal = await MealRepository().getMealDetail(idMeal);
  return detailMeal;
});

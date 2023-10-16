import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/model/meal_detail.dart';
import '../repository/meal_api.dart';

final getAllCategoryMeals = FutureProvider.family<List<Meals>,String>((ref,mealName) async {
  final categories =  await MealRepository().getMealOnCategory(mealName);
  return categories;
});

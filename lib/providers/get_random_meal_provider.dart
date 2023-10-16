import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/repository/meal_api.dart';

final randomMealProvider = FutureProvider((ref) async {
  final randomMeal =  await MealRepository().getRandomMeal();
  return randomMeal;
});
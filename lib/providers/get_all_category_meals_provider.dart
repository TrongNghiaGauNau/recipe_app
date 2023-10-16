import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/meal.dart';
import '../repository/meal_api.dart';

final getAllCategoryMeals = FutureProvider.family<List<Meal>,String>((ref,mealName) async {
  final categories =  await MealRepository().getMealOnCategory(mealName);
  return categories;
});

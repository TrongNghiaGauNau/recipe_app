import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../repository/meal_api.dart';

final getAllCategories = FutureProvider<List<String>>((ref) async {
  final categories =  await MealRepository().getAllCategories();
  return categories;
});

import 'package:dio/dio.dart';
import 'package:recipe_food_app/model/meal_detail.dart';
import '../constanst.dart';
import '../model/meal.dart';

class MealRepository {
  final dio = Dio();

  //get randomMeal for Trending now
  Future<Meals> getRandomMeal() async {
    const url = '$apiMainLink/random.php';
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        final mealList = data['meals'];
        final meal = mealList[0];
        final randomMeal = Meals.fromJson(meal);
        return randomMeal;
      } else {
        throw Exception('Failed to load meal');
      }
    } catch (e) {
      throw Exception('Failed to load meal: $e');
    }
  }

  //get all categories
  Future<List<String>> getAllCategories() async {
    const url = '$apiMainLink/list.php?c=list';
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        final List<String> categories =
            List<String>.from(data['meals'].map((meal) => meal['strCategory']));
        return categories;
      } else {
        throw Exception('Failed to get all categories');
      }
    } catch (e) {
      throw Exception('Failed to get all categories: $e');
    }
  }

  //get list of meal base on category
  Future<List<Meals>> getMealOnCategory(String mealName) async {
    final url = '$apiMainLink/filter.php?c=$mealName';
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        final idMealList = data["meals"].map((meal) {
          return meal['idMeal'];
        }).toList();
        final List<Meals> mealList = [];
        for(String idMeal in idMealList){
          try {
            final meal = await getMealDetail(idMeal);
            mealList.add(meal);
          } catch (e) {
            print('Error fetching meal details for idMeal: $idMeal - $e');
          }
        }
        return mealList;
      } else {
        throw Exception('Failed to get all meals base on categories');
      }
    } catch (e) {
      throw Exception('Failed to get all meals base on  categories: $e');
    }
  }

  //get meal detail
  Future<Meals> getMealDetail(String idMeal) async {
    final url = '$apiMainLink/lookup.php?i=$idMeal';
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        final mealsList = data['meals'];
        final meal = mealsList[0];
        final mealDetail = Meals.fromJson(meal);
        return mealDetail;

      } else {
        throw Exception('Failed to get all meals base on categories');
      }
    } catch (e) {
      throw Exception('Failed to get all meals base on  categories: $e');
    }
  }
}

import 'package:dio/dio.dart';
import 'package:recipe_food_app/constants/constanst.dart';
import 'package:recipe_food_app/constants/file_type.dart';
import 'package:recipe_food_app/model/meal.dart';
import 'package:recipe_food_app/model/meal_detail.dart';
import 'package:recipe_food_app/model/user/user_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_food_app/constants/firebase_collection_name.dart';
import 'package:recipe_food_app/constants/firebase_filed_name.dart';
import 'package:recipe_food_app/typdef/typdef.dart';

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
        for (String idMeal in idMealList) {
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

  //search for meal
  Future<List<Meals>> searchMeal(String input) async {
    final url = '$apiMainLink/search.php?f=$input';
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        final List<dynamic> mealsData = data['meals'];
        // Create a List<Meal> by mapping the JSON data to Meal objects
        final List<Meals> mealsList = mealsData.map((meal) {
          return Meals.fromJson(meal);
        }).toList();

        // Now you have a List<Meal> containing the meal data
        print('mealsList: $mealsList');
        return mealsList;
      } else {
        throw Exception('Failed to get all meals base base on searching');
      }
    } catch (e) {
      throw Exception('Failed to get all meals base base on searching: $e');
    }
  }
}


Future<UserThongTin?> getUserInfo(UserId userId) async {
  try {
    final userSnapshot = await FirebaseFirestore.instance
        .collection(FirebaseCollectionName.users)
        .where(
      FirebaseFieldName.userId,
      isEqualTo: userId,
    )
        .limit(1)
        .get();

    if (userSnapshot.docs.isNotEmpty) {
      final userData = userSnapshot.docs.first.data();
      return UserThongTin(
        userId: userData[FirebaseFieldName.userId],
        displayName: userData[FirebaseFieldName.displayName],
        email: userData[FirebaseFieldName.email],
      );
    }

    return null; // User not found
  } catch (e) {
    print('Error fetching user info: $e');
    return null;
  }
}

Future<List<Meal?>> getListMealInfo(UserId? userId) async {
  final List<Meal?> listMeals = [];
  try {
    final mealSnapshot = await FirebaseFirestore.instance
        .collection(FirebaseCollectionName.meals)
        .where(
          FirebaseFieldName.userId,
          isEqualTo: userId,
        )
        .get();

    if (mealSnapshot.docs.isNotEmpty) {
      // final userData = mealSnapshot.docs;
      for (QueryDocumentSnapshot document in mealSnapshot.docs) {
        // Access the data in each document
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        listMeals.add(
            Meal(
              uid:data[FirebaseFieldName.userId],
              idMeal: data[FirebaseFieldName.idMeal],
              mealName: data[FirebaseFieldName.mealName],
              ingredients: (data[FirebaseFieldName.ingredients] as List).map((ingredient) => ingredient.toString()).toList(),
              fileType: data[FirebaseFieldName.fileType] == 'image'? FileType.image :FileType.video,
              category: data[FirebaseFieldName.category],
              area: data[FirebaseFieldName.area],
              fileUrl: data[FirebaseFieldName.fileUrl],
              originalFileStorageId: data[FirebaseFieldName.originalFileStorageId],
              thumbnailStorageId:data[FirebaseFieldName.thumbnailStorageId],
              thumbnailUrl: data[FirebaseFieldName.thumbnailUrl],
            )
        );
      }
      return listMeals;
    }

    return []; // User not found
  } catch (e) {
    print('Error fetching user info: $e');
    return [];
  }
}
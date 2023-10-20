import 'dart:collection' show MapView;
import 'package:flutter/foundation.dart' show immutable;
import 'package:recipe_food_app/constants/file_type.dart';
import 'package:recipe_food_app/constants/meal_key.dart';

@immutable
class Meal extends MapView<String, dynamic> {
  Meal({
    required String uid,
    required String idMeal,
    required String mealName,
    required String thumbnailUrl,
    required String fileUrl,
    required FileType fileType,
    required String area,
    required String category,
    required String thumbnailStorageId,
    required String originalFileStorageId,
    required List<String> ingredients,
  }):
        super({
        MealKey.userId: uid,
        MealKey.idMeal: idMeal,
        MealKey.mealName: mealName,
        MealKey.thumbnailUrl: thumbnailUrl,
        MealKey.fileUrl: fileUrl,
        MealKey.fileType: fileType.name,
        MealKey.area: area,
        MealKey.category: category,
        MealKey.thumbnailStorageId: thumbnailStorageId,
        MealKey.originalFileStorageId: originalFileStorageId,
        MealKey.ingredients: ingredients,
      });




  // Meal copyWith({
  //   String? uid,
  //   String? idMeal,
  //   String? strMeal,
  //   String? strCategory,
  //   String? strArea,
  //   String? strMealThumb,
  //   List<String>? ingredient,
  // }) {
  //   return Meal(
  //     uid: uid?? this.uid,
  //     idMeal: idMeal ?? this.idMeal,
  //     strMeal: strMeal ?? this.strMeal,
  //     strCategory: strCategory ?? this.strCategory,
  //     strArea: strArea ?? this.strArea,
  //     strMealThumb: strMealThumb ?? this.strMealThumb,
  //     ingredient: ingredient ?? this.ingredient,
  //   );
  // }

}

import 'package:flutter/foundation.dart' show immutable;

@immutable
class MealKey {
  static const userId = 'uid';
  static const idMeal = 'id_meal';
  static const mealName = 'meal_name';
  static const thumbnailUrl = 'thumbnail_url';
  static const fileUrl = 'file_url';
  static const fileType = 'file_type';
  static const area = 'area';
  static const category = 'category';
  static const thumbnailStorageId = 'thumbnail_storage_id';
  static const originalFileStorageId = 'original_file_storage_id';
  static const ingredients = 'ingredients';

  const MealKey._();
}

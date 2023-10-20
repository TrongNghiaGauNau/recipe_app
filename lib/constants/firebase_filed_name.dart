import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseFieldName{
  static const userId = 'uid';
  static const postId = 'post_id';
  static const comment = 'comment';
  static const createdAt = 'created_at';
  static const date = 'date';
  static const displayName = 'display_name';
  static const email = 'email';
  static const idMeal = 'id_meal';
  static const area = 'area';
  static const category = 'category';
  static const fileType = 'file_type';
  static const fileUrl = 'file_url';
  static const mealName = 'meal_name';
  static const originalFileStorageId = 'original_file_storage_id';
  static const thumbnailStorageId = 'thumbnail_storage_id';
  static const thumbnailUrl = 'thumbnail_url';
  static const ingredients = 'ingredients';
  const FirebaseFieldName._();
}
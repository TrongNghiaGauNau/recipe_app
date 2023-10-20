import 'package:flutter/foundation.dart' show immutable;

@immutable
class FirebaseCollectionName{
  static const thumbnails = 'thumbnails';
  static const comments = 'comments';
  static const likes = 'likes';
  static const meals = 'meals';
  static const users = 'users';
  const FirebaseCollectionName._();
}
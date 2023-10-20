import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/upload_new_recipe/recipe_upload_notifier.dart';
import 'package:recipe_food_app/typdef/typdef.dart';

final recipeUploadProvider =
StateNotifierProvider<RecipeUploadNotifier, IsLoading>(
      (ref) => RecipeUploadNotifier(),
);

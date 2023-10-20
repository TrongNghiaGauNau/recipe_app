import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/get_recipe/get_recipe_notifier.dart';
import 'package:recipe_food_app/providers/get_recipe/meal_state.dart';
import 'package:recipe_food_app/providers/get_user_id_provider.dart';

final recipeRetrieveProvider =
    StateNotifierProvider<RecipeRetrieveNotifier, RecipeState>(
  (ref) => RecipeRetrieveNotifier(currentUserId: ref.watch(userIdProvider)),
);

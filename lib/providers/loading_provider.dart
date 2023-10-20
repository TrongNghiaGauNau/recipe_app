import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/auth_state_provider.dart';
import 'package:recipe_food_app/providers/upload_new_recipe/recipe_upload_provider.dart';

final isLoadingProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  final isUploadingMeal= ref.watch(recipeUploadProvider);
  return authState.isLoading || isUploadingMeal;
});





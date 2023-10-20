import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/favorite/favorite_provider.dart';
import 'package:recipe_food_app/providers/favorite/favorite_state.dart';
import 'package:recipe_food_app/screens/meal_detail/components/body_meal_detail.dart';
import 'package:recipe_food_app/model/meal_detail.dart';

class MealDetail extends ConsumerWidget {
  const MealDetail({super.key, required this.meal});

  final Meals meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String?> ingredientsList = [
      meal.strIngredient1,
      meal.strIngredient2,
      meal.strIngredient3,
      meal.strIngredient4,
      meal.strIngredient5,
      meal.strIngredient6,
      meal.strIngredient7,
      meal.strIngredient8,
      meal.strIngredient9,
      meal.strIngredient10,
      meal.strIngredient11,
      meal.strIngredient12,
      meal.strIngredient13,
      meal.strIngredient14,
      meal.strIngredient15,
      meal.strIngredient16,
      meal.strIngredient17,
      meal.strIngredient18,
      meal.strIngredient19,
      meal.strIngredient20,
    ];
    // final isFavorite = ref.watch(favoriteStateProvider).favoriteProducts.contains(meal);
    final listFavorite =
        ref.watch(favoriteStateProvider).favoriteProducts;
    final isFavorite = listFavorite.contains(meal);

    // xử lý khi add hoac remove favorite
    ref.listen<FavoriteState>(favoriteStateProvider,
        (FavoriteState? previous, FavoriteState next) {
      if (previous?.favoriteProducts != next.favoriteProducts) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Favorite list has updated'),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (!isFavorite) {
                ref.read(favoriteStateProvider.notifier).addToFavorite(meal);
              } else {
                ref
                    .read(favoriteStateProvider.notifier)
                    .removeFromFavorite(meal);
              }
            },
            icon: isFavorite
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: BodyMealDetail(meals: meal, ingredientsList: ingredientsList),
    );
  }
}

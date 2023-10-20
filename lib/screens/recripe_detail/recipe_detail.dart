import 'package:flutter/material.dart';
import 'package:recipe_food_app/model/meal.dart';
import 'package:recipe_food_app/screens/recripe_detail/components/body_recipe_detail.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // if (!isFavorite) {
              //   ref.read(favoriteStateProvider.notifier).addToFavorite(meal);
              // } else {
              //   ref
              //       .read(favoriteStateProvider.notifier)
              //       .removeFromFavorite(meal);
              // }
            },
            icon:
            // isFavorite
            //     ? const Icon(
            //   Icons.favorite,
            //   color: Colors.red,
            // ):
                 const Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: BodyRecipeDetail(meal: meal),
    );
  }
}

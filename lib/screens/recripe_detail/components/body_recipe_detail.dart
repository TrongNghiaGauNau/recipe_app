import 'package:flutter/material.dart';
import 'package:recipe_food_app/components/header.dart';
import 'package:recipe_food_app/constants/meal_key.dart';
import 'package:recipe_food_app/model/meal.dart';
import 'package:recipe_food_app/screens/recripe_detail/components/category_and_area_titile.dart';
import 'package:recipe_food_app/screens/recripe_detail/components/ingredients_list.dart';
import 'package:recipe_food_app/screens/recripe_detail/components/ingredients_title.dart';
import 'package:recipe_food_app/screens/recripe_detail/components/meal_detail_image.dart';

class BodyRecipeDetail extends StatelessWidget {
  const BodyRecipeDetail({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final List<String> ingredients = meal[MealKey.ingredients];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Header(textHeader: meal[MealKey.mealName]),
            const SizedBox(
              height: 20,
            ),
            MealDetailImage(
              image: meal[MealKey.fileUrl],
              fileType: meal[MealKey.fileType],
            ),
            const SizedBox(
              height: 20,
            ),
            CategoryAndAreaTitle(meal: meal),
            const SizedBox(
              height: 20,
            ),
            IngredientsTitle(ingredients: ingredients),
            const SizedBox(
              height: 10,
            ),
            IngredientsList(ingredients: ingredients),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}








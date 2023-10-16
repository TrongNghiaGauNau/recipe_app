import 'package:flutter/material.dart';
import 'package:recipe_food_app/screens/meal_detail/components/body_meal_detail.dart';
import 'package:recipe_food_app/model/meal_detail.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({super.key, required this.meal});

  final Meals meal;

  @override
  Widget build(BuildContext context) {
    final List<String> ingredientsList = [
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
    return Scaffold(
      appBar: AppBar(),
      body: BodyMealDetail(meals: meal, ingredientsList: ingredientsList),
    );
  }
}

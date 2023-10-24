import 'package:flutter/material.dart';
import 'package:recipe_food_app/constants/meal_key.dart';
import 'package:recipe_food_app/model/meal.dart';

class CategoryAndAreaTitle extends StatelessWidget {
  const CategoryAndAreaTitle({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //category
        const Icon(
          Icons.category,
          color: Colors.black,
        ),
        const SizedBox(
          width: 5,
        ),
        Text('Category: ${meal[MealKey.category]}'),
        const Spacer(),
        const Icon(
          Icons.location_on,
          color: Colors.black,
        ),
        const SizedBox(
          width: 5,
        ),
        Text('Area: ${meal[MealKey.area]}'),
        const Spacer(),
        //area
      ],
    );
  }
}
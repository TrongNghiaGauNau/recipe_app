import 'package:flutter/material.dart';
import 'package:recipe_food_app/components/header.dart';
import 'package:recipe_food_app/model/meal_detail.dart';

class BodyMealDetail extends StatelessWidget {
  const BodyMealDetail({
    super.key,
    required this.meals,
    required this.ingredientsList,
  });

  final Meals meals;
  final List<String?> ingredientsList;

  @override
  Widget build(BuildContext context) {
    final List<String?> ingredients = [];
    for (String? ingredient in ingredientsList) {
      if (ingredient != '') {
        ingredients.add(ingredient);
      }
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Header(textHeader: meals.strMeal),
            const SizedBox(
              height: 20,
            ),
            MealDetailImage(
              image: meals.strMealThumb,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                //category
                const Icon(
                  Icons.category,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text('Category: ${meals.strCategory}'),
                const Spacer(),
                const Icon(
                  Icons.location_on,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text('Area: ${meals.strArea}'),
                const Spacer(),
                //area
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                ),
                const Spacer(),
                Text(
                  '${ingredients.length} items',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black38,
                        fontSize: 15,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              itemCount: ingredients.length,
              shrinkWrap: true,
              // Ensure the ListView takes only the space it needs
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                // Create a widget for each item in the list
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black12),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 15,
                      ),
                      child: Text(
                        ingredients[index]!,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Instructions',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                ),
                const Spacer(),
              ],
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(meals.strInstructions!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MealDetailImage extends StatelessWidget {
  const MealDetailImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: double.infinity,
              height: size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

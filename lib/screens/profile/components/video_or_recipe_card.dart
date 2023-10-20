import 'package:flutter/material.dart';
import 'package:recipe_food_app/constants/meal_key.dart';
import 'package:recipe_food_app/model/meal.dart';
import 'package:recipe_food_app/screens/recripe_detail/recipe_detail.dart';

class VideoOrRecipeCard extends StatelessWidget {
  const VideoOrRecipeCard({
    super.key,
    required this.meal,
  });

  final Meal? meal;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => RecipeDetail(meal: meal!),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Center(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: meal == null
                      ? Image.asset(
                          'assets/images/food_horizontal.jpg',
                          fit: BoxFit.fill,
                        )
                      : Image.network(
                          '${meal![MealKey.thumbnailUrl]}',
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              Positioned(
                top: 10,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black38,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text.rich(
                      TextSpan(
                        style: const TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: meal == null
                                ? 'Can not get meal name \n'
                                : '${meal![MealKey.mealName]} \n',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                              text: meal == null
                                  ? 'Can not get meal category'
                                  : '${meal![MealKey.category]}'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

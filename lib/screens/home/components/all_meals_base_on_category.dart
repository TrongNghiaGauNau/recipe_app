import 'package:flutter/material.dart';
import 'package:recipe_food_app/model/meal_detail.dart';
import 'package:recipe_food_app/screens/meal_detail/meal_detail.dart';

class AllMealBaseOnCategory extends StatelessWidget {
  const AllMealBaseOnCategory({
    super.key,
    required this.listMeals,
  });

  final List<Meals> listMeals;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listMeals.length,
        itemBuilder: (context, index) {
          return PopularOfferCard(
            meal: listMeals[index],
          );
        },
      ),
    );
  }
}

class PopularOfferCard extends StatelessWidget {
  const PopularOfferCard({
    super.key,
    required this.meal,
  });

  final Meals meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => MealDetail(meal: meal),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          children: [
            SizedBox(
              width: 200,
              height: 300,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 75),
                    height: 225,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 70, left: 5, right: 5),
                          child: Text(
                            meal.strMeal,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 10, right: 10, bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    'Time',
                                    style: TextStyle(color: Colors.black38),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    '10 mins',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  const Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(5),
                                      child:
                                          Icon(Icons.favorite_border_rounded),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 25,
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(meal.strMealThumb),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

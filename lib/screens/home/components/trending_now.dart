import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/model/meal_detail.dart';
import 'package:recipe_food_app/providers/get_meal_detail_provider.dart';
import 'package:recipe_food_app/providers/get_random_meal_provider.dart';
import 'package:recipe_food_app/screens/home/components/section_title.dart';
import 'package:recipe_food_app/screens/meal_detail/meal_detail.dart';

class TrendingNow extends HookConsumerWidget {
  const TrendingNow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomMeal = ref.watch(randomMealProvider);
    // var getRandomMealInfo = useState(false);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionTitle(
          press: () {},
          text: 'Trending now ',
          trending: true,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          child: randomMeal.when(
            data: (meal) {
              // final getMealDetail = ref.read(geMealDetailProvider(meal.idMeal));
              // getMealDetail.when(
              //   data: (meal) {
              //     getRandomMealInfo.value = true;
              //   },
              //   error: (error, stackTrace) => getRandomMealInfo.value = false,
              //   loading: () {},
              // );

              return SpecialOfferCard(
                meal: meal,
              );
            },
            error: (error, stackTrace) => const Center(
              child: Text('Can not get meal...'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.meal,
  });

  final Meals meal;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MealDetail(meal: meal),
          ),
        );
      },
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
                child: Image.network(
                  meal.strMealThumb,
                  fit: BoxFit.fill,
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
                          text: '${meal.strMeal}\n',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: meal.strCategory)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

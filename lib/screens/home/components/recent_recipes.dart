import 'package:flutter/material.dart';
import 'package:recipe_food_app/screens/home/components/section_title.dart';

class RecentRecipes extends StatelessWidget {
  const RecentRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(press: (){}, text: 'Recent Recipes'),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 275,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return RecentRecipeCard(
                image: 'assets/images/food_bowl.jpg',
                press: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}

class RecentRecipeCard extends StatelessWidget {
  const RecentRecipeCard({
    super.key,
    required this.image,
    required this.press,
  });

  final String image;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        width: 175,
        height: 175,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
              ),
              height: 175,
              width: 175,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Indonesian chicken burger',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Text(
                    'By Adriana Curl',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                    textAlign: TextAlign.left,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recipe_food_app/screens/home/components/section_title.dart';

class PopularCreators extends StatelessWidget {
  const PopularCreators({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(text: 'Popular Creator',press: (){}),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return PopularCreatorCard(
                image:
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                press: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}

class PopularCreatorCard extends StatelessWidget {
  const PopularCreatorCard({
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
        width: 120,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(image),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Bui Trong Nghia',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

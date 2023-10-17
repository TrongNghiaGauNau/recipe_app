import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/favorite/favorite_provider.dart';
import 'package:recipe_food_app/screens/save/components/favorite_card.dart';
import '../../components/header.dart';

class SaveScreen extends ConsumerWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final size = MediaQuery.of(context).size;
    final listFavorite = ref.watch(favoriteStateProvider).favoriteProducts;

    return SafeArea(
      child: SingleChildScrollView(
        child: listFavorite.isEmpty
            ? SizedBox(
                width: size.width,
                height: size.height,
                child: const Column(
                  children: [
                    Spacer(),
                    Text(
                      'Your favorite list is empty \nAdd some food',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.fastfood,
                      color: Colors.redAccent,
                    ),
                    Spacer(),
                  ],
                ),
              )
            : Column(
                children: [
                  const SizedBox(height: 20),
                  const Header(textHeader: 'Saved recipes'),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true, // Set shrinkWrap to true
                    physics: const NeverScrollableScrollPhysics(), // Disable scrolling
                    itemCount: listFavorite.length,
                    itemBuilder: (context, index) {
                      return FavoriteCard(
                        meal: listFavorite[index],
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}

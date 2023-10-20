import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/constants/file_type.dart';
import 'package:recipe_food_app/constants/meal_key.dart';
import 'package:recipe_food_app/model/meal.dart';
import 'package:recipe_food_app/providers/get_recipe/get_recipe_provider.dart';
import 'package:recipe_food_app/providers/video_or_recipe_tab_provder.dart';
import 'package:recipe_food_app/screens/profile/components/avatar_heading.dart';
import 'package:recipe_food_app/screens/profile/components/username_or_description.dart';
import 'package:recipe_food_app/screens/profile/components/video_or_recipe_card.dart';
import 'package:recipe_food_app/screens/profile/components/video_or_recipe_tab.dart';

class BodyProfileScreen extends ConsumerWidget {
  const BodyProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listRecipes = ref.watch(recipeRetrieveProvider).listMeals;
    final isVideoTab = ref.watch(videoOrRecipeTabProvider);
    final List<Meal?> listVidOrRe = isVideoTab
        ? listRecipes
            .map((recipe) => recipe[MealKey.fileType] == FileType.video)
            .toList()
        : listRecipes
            .map((recipe) => recipe[MealKey.fileType] == FileType.video)
            .toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const AvatarPart(),
          const SizedBox(
            height: 10,
          ),
          const UsernameOrEmail(
            isUsername: true,
            fontSize: 20,
            bold: true,
          ),
          const UsernameOrEmail(
            fontSize: 15,
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          // nút video + recipe
          const VideoOrRecipeTab(),
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listMeal.length,
            itemBuilder: (context, index) {
              return VideoOrRecipeCard(
                meal: listMeal[index],
              );
            },
          ),
        ],
      ),
    );
  }
}

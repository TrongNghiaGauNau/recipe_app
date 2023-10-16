import 'package:flutter/material.dart';
import 'package:recipe_food_app/components/header.dart';
import 'package:recipe_food_app/screens/home/components/popular_category.dart';
import 'package:recipe_food_app/screens/home/components/recent_recipes.dart';
import 'package:recipe_food_app/screens/home/components/search_field.dart';
import 'package:recipe_food_app/screens/home/components/trending_now.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:20),
            Header(textHeader: 'Find best recipes \nfor cooking'),
            SizedBox(height:20),
            SearchField(),
            SizedBox(height:20),
            TrendingNow(),
            SizedBox(height:20),
            PopularCategory(),
            SizedBox(height:20),
            RecentRecipes(),
            // SizedBox(height:20),
          ],
        ),
      ),
    );
  }
}

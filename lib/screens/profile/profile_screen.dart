import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/get_recipe/get_recipe_provider.dart';
import 'package:recipe_food_app/screens/profile/components/body_profile_scree.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(
            top: 15,
            left: 10,
          ),
          child: Text(
            'My profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
          onRefresh: () {
            ref.refresh(recipeRetrieveProvider);
            return Future.delayed(const Duration(seconds: 1));
          },
          child: const BodyProfileScreen()),
    );
  }
}

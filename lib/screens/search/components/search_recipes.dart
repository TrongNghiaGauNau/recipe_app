import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/search/search_meal_provider.dart';

class SearchRecipes extends ConsumerWidget {
  const SearchRecipes({
    super.key,
    required this.input,
  });

  final TextEditingController input;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 15, vertical: 5),
          child: TextField(
            controller: input,
            onChanged: (value) {
              input.text = value;
              ref
                  .read(searchMealsProvider.notifier)
                  .searchMeal(input.text);
            },
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Search Recipes',
              prefixIcon: Icon(
                Icons.search,
                size: 25,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 9,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
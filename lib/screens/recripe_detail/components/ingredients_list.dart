import 'package:flutter/material.dart';

class IngredientsList extends StatelessWidget {
  const IngredientsList({
    super.key,
    required this.ingredients,
  });

  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ingredients.length,
      shrinkWrap: true,
      // Ensure the ListView takes only the space it needs
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        // Create a widget for each item in the list
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black12),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 15,
              ),
              child: Text(
                ingredients[index],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
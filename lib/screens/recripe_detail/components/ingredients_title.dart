import 'package:flutter/material.dart';

class IngredientsTitle extends StatelessWidget {
  const IngredientsTitle({
    super.key,
    required this.ingredients,
  });

  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Ingredients',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const Spacer(),
        Text(
          '${ingredients.length} items',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Colors.black38,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
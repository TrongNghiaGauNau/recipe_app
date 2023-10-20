import 'package:flutter/material.dart';

class IngredientsTitle extends StatelessWidget {
  const IngredientsTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Ingredients',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
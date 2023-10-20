import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/screens/create_recipe/components/text_field_recipe.dart';

class IngredientsList extends HookConsumerWidget {
  const IngredientsList({
    super.key,
    required this.size,
    required this.ingredientsList,
  });

  final Size size;
  final ValueNotifier<List<TextEditingController>> ingredientsList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingredientListValue = useValueListenable(ingredientsList);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ingredientListValue.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width * 0.8,
                child: TextFieldRecipe(
                  controller: ingredientListValue[index],
                  icon: null,
                  hintText: 'Ingredient name',
                ),
              ),
             //gesture
              GestureDetector(
                onTap: () {
                  ingredientsList.value = [...ingredientListValue, TextEditingController()];
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(child: Icon(Icons.add)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


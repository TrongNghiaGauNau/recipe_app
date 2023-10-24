import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/constants/firebase_filed_name.dart';
import 'package:recipe_food_app/constants/meal_key.dart';
import 'package:recipe_food_app/model/meal.dart';
import 'package:recipe_food_app/screens/recripe_detail/components/body_recipe_detail.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({super.key, required this.meal});

  final Meal meal;

  Future<int> deleteRecipe(BuildContext context) async {
    final recipeToDelete = await FirebaseFirestore.instance
        .collection('meals') // Replace with your collection name
        .where(FirebaseFieldName.idMeal, isEqualTo: meal[MealKey.idMeal])
        .get();

    // Use a Completer to handle the async operation and return the result.
    Completer<int> completer = Completer<int>();

    // Loop through the documents that match the query and delete them
    for (QueryDocumentSnapshot documentSnapshot in recipeToDelete.docs) {
      DocumentReference documentReference = documentSnapshot.reference;
      await documentReference.delete().then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Delete recipe successfully'),
          ),
        );


        completer.complete(1);
      }).catchError(
        (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Oops.Something went wrong'),
            ),
          );
          completer.complete(0);
        },
      );
    }
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Consumer(builder: (ctx, ref, child) {
                    return AlertDialog(
                      title: const Text('Delete recipe'),
                      content: const Text('Do you want to delete this recipe'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            final pop = await deleteRecipe(context);
                            if(pop == 1){
                              //pop the dialog
                              Navigator.of(context).pop();
                              //pop the screen
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  });
                },
              );
            },
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: BodyRecipeDetail(meal: meal),
    );
  }
}

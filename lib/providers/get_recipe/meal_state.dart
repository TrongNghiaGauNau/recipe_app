import 'package:flutter/foundation.dart' show immutable;
import 'package:recipe_food_app/model/meal.dart';
import 'package:equatable/equatable.dart';

@immutable
class RecipeState extends Equatable{
  final List<Meal?> listMeals;

  const RecipeState({
   required this.listMeals,
  });

  RecipeState copyWith({
    List<Meal?>? listMeals,
  }) {
    return RecipeState(
      listMeals: listMeals ?? this.listMeals,
    );
  }

  @override
  List<Object> get props => [listMeals];
}

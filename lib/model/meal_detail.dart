import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_detail.freezed.dart';

part 'meal_detail.g.dart';

@freezed
class Meals with _$Meals {
  const factory Meals({
    required String idMeal,
    required String strMeal,
    required dynamic strDrinkAlternate,
    required String strCategory,
    required String strArea,
    required String strInstructions,
    required String strMealThumb,
    required String strTags,
    required String strYoutube,
    required String strIngredient1,
    required String strIngredient2,
    required String strIngredient3,
    required String strIngredient4,
    required String strIngredient5,
    required String strIngredient6,
    required String strIngredient7,
    required String strIngredient8,
    required String strIngredient9,
    required String strIngredient10,
    required String strIngredient11,
    required String strIngredient12,
    required String strIngredient13,
    required String strIngredient14,
    required String strIngredient15,
    required dynamic strIngredient16,
    required dynamic strIngredient17,
    required dynamic strIngredient18,
    required dynamic strIngredient19,
    required dynamic strIngredient20,
    required String strMeasure1,
    required String strMeasure2,
    required String strMeasure3,
    required String strMeasure4,
    required String strMeasure5,
    required String strMeasure6,
    required String strMeasure7,
    required String strMeasure8,
    required String strMeasure9,
    required String strMeasure10,
    required String strMeasure11,
    required String strMeasure12,
    required String strMeasure13,
    required String strMeasure14,
    required String strMeasure15,
    required dynamic strMeasure16,
    required dynamic strMeasure17,
    required dynamic strMeasure18,
    required dynamic strMeasure19,
    required dynamic strMeasure20,
    required dynamic strSource,
    required dynamic strImageSource,
    required dynamic strCreativeCommonsConfirmed,
    required dynamic dateModified,
  }) = _Meals;

  factory Meals.fromJson(Map<String, Object?> json) => _$MealsFromJson(json);
}

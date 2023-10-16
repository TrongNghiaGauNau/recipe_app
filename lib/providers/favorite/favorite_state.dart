import 'package:recipe_food_app/model/meal_detail.dart';

class FavoriteState {
  const FavoriteState({
    this.favoriteProducts = const [],
  });

  final List<Meals> favoriteProducts;

  FavoriteState copyWith({
    final List<Meals>? favoriteProducts,
  }) =>
      FavoriteState(
        favoriteProducts: favoriteProducts ?? this.favoriteProducts,
      );
}

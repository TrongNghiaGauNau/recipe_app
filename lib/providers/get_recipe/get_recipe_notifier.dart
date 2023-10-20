import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/model/meal.dart';
import 'package:recipe_food_app/providers/get_recipe/meal_state.dart';
import 'package:recipe_food_app/repository/meal_api.dart';
import 'package:recipe_food_app/typdef/typdef.dart';

class RecipeRetrieveNotifier extends StateNotifier<RecipeState> {
  // final _authenticator = const Authenticator();
  final String? currentUserId;

  RecipeRetrieveNotifier({required this.currentUserId})
      : super(const RecipeState(listMeals: [])) {
    if (currentUserId != null) {
      getListMeals(userId: currentUserId);
    }
  }

  Future<void> getListMeals({
    required UserId? userId,
  }) async {
    final List<Meal?> listMeals = await getListMealInfo(userId);
    if (listMeals.isNotEmpty) {
      state = state.copyWith(listMeals: listMeals);
    }
    print('ID NGƯƠI DUNG Ơ DAY NE:$userId');
  }
}

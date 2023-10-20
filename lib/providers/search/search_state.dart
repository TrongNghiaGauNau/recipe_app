import 'package:recipe_food_app/model/meal_detail.dart';

class SearchState {
  const SearchState({
    this.searchList = const [],
    this.isLoading = false,
  });

  final List<Meals> searchList;
  final bool isLoading;

  SearchState copyWith({
    final List<Meals>? searchList,
    final bool? isLoading,
  }) =>
      SearchState(
        searchList: searchList ?? this.searchList,
        isLoading: isLoading ?? this.isLoading,
      );
}

class Meal {
  final String idMeal;
  final String title;
  final String? category;
  final String mealThumb;

  Meal({
    required this.idMeal,
    required this.title,
    this.category,
    required this.mealThumb,
  });

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      idMeal: map['idMeal'] as String,
      title: map['strMeal'] as String,
      category: (map['strCategory'] as String?),
      mealThumb: map['strMealThumb'] as String,
    );
  }
}

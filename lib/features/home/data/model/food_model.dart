class FoodModel {
  final String meal;
  final String mealThumb;
  final String idMeal;

  FoodModel(
      {required this.meal, required this.mealThumb, required this.idMeal});

  factory FoodModel.fromMap(Map<String, dynamic> json) {
    return FoodModel(
        meal: json['strMeal'],
        mealThumb: json['strMealThumb'],
        idMeal: json['idMeal']);
  }
}

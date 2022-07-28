class CategoryModel<T> {
  final List<T> meals;

  CategoryModel({required this.meals});

  static CategoryModel fromMap<T>(
      {required Map<String, dynamic> json,
      required T Function(Map<String, dynamic> map) fromMap}) {
    return CategoryModel(
        meals: (json['meals'] as List).map((e) => fromMap(e)).toList());
  }
}

class CategoryItem {
  final String category;

  CategoryItem({required this.category});

  factory CategoryItem.fromMap(Map<String, dynamic> json) {
    return CategoryItem(category: json['strCategory']);
  }
}

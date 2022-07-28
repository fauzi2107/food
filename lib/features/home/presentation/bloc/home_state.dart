part of 'home_bloc.dart';

class HomeState {
  HomeState({
    this.isLoading = false,
    this.listCategory = const [],
    this.listFood = const [],
  });

  final bool isLoading;
  final List<CategoryItem> listCategory;
  final List<FoodModel> listFood;

  HomeState copyWith({
    bool? isLoading,
    List<CategoryItem>? listCategory,
    List<FoodModel>? listFood,
  }) =>
      HomeState(
          isLoading: isLoading ?? this.isLoading,
          listFood: listFood ?? this.listFood,
          listCategory: listCategory ?? this.listCategory);
}

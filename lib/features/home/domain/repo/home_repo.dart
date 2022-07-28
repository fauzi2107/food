import 'package:food/features/home/data/model/category_model.dart';
import 'package:food/features/home/data/model/food_model.dart';

abstract class HomeRepo {
  Future<List<CategoryItem>> getListCategory();
  Future<List<FoodModel>> getFoodByCategory(String category);
}

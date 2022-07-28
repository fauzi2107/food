import 'package:dio/dio.dart';
import 'package:food/features/home/data/model/category_model.dart';
import 'package:food/features/home/data/model/food_model.dart';
import 'package:food/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final Dio dio;

  HomeRepoImpl(this.dio);

  @override
  Future<List<FoodModel>> getFoodByCategory(String category) async {
    final response = await dio.get('/filter.php?c=$category');
    final result = CategoryModel.fromMap<FoodModel>(
            json: response.data, fromMap: FoodModel.fromMap)
        .meals;

    return result as List<FoodModel>;
  }

  /// Func get list category
  @override
  Future<List<CategoryItem>> getListCategory() async {
    final response = await dio.get('/list.php?c=list');
    final result = CategoryModel.fromMap<CategoryItem>(
            json: response.data, fromMap: CategoryItem.fromMap)
        .meals;

    return result as List<CategoryItem>;
  }
}

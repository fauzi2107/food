import 'package:dio/dio.dart';
import 'package:food/features/detail/data/model/detail_meal_model.dart';
import 'package:food/features/detail/domain/repo/detail_repo.dart';
import 'package:food/features/home/data/model/category_model.dart';
import 'package:food/ui_export.dart';

@LazySingleton(as: DetailRepo)
class DetailRepoImpl implements DetailRepo {
  final Dio dio;

  DetailRepoImpl(this.dio);

  @override
  Future<DetailFoodModel> getDetailInfo(String id) async {
    final response = await dio.get('/lookup.php?i=$id');
    final result = CategoryModel.fromMap(
            json: response.data, fromMap: DetailFoodModel.fromMap)
        .meals;
    return result.first as DetailFoodModel;
  }
}

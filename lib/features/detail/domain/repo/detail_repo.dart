import 'package:food/features/detail/data/model/detail_meal_model.dart';

abstract class DetailRepo {
  Future<DetailFoodModel> getDetailInfo(String id);
}

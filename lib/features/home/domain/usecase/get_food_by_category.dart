import 'package:food/features/home/data/model/food_model.dart';
import 'package:food/features/home/domain/repo/home_repo.dart';

import '../../../../ui_export.dart';

@injectable
class GetFoodByCategory extends ResultUseCase<List<FoodModel>, String> {
  final HomeRepo repo;

  GetFoodByCategory(this.repo);

  @override
  Future<Result<List<FoodModel>, Failure>> processCall(String category) async {
    try {
      final result = await repo.getFoodByCategory(category);
      return Ok(result);
    } catch (err, stacktrace) {
      return Err(await errorCatcher(e: err, stackTrace: stacktrace));
    }
  }
}

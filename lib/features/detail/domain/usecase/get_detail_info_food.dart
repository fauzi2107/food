import 'package:food/features/detail/data/model/detail_meal_model.dart';
import 'package:food/features/detail/domain/repo/detail_repo.dart';
import 'package:food/ui_export.dart';

@injectable
class GetDetailInfoFood extends ResultUseCase<DetailFoodModel, String> {
  final DetailRepo repo;

  GetDetailInfoFood(this.repo);

  @override
  Future<Result<DetailFoodModel, Failure>> processCall(String id) async {
    try {
      final result = await repo.getDetailInfo(id);
      return Ok(result);
    } catch (err, stacktrace) {
      return Err(await errorCatcher(e: err, stackTrace: stacktrace));
    }
  }
}

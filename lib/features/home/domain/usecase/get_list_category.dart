import 'package:food/features/home/data/model/category_model.dart';
import 'package:food/features/home/domain/repo/home_repo.dart';

import '../../../../ui_export.dart';

@injectable
class GetListCategory extends ResultUseCase<List<CategoryItem>, NoParams> {
  final HomeRepo repo;

  GetListCategory(this.repo);

  @override
  Future<Result<List<CategoryItem>, Failure>> processCall(
      NoParams params) async {
    try {
      final result = await repo.getListCategory();
      return Ok(result);
    } catch (err, stacktrace) {
      return Err(await errorCatcher(e: err, stackTrace: stacktrace));
    }
  }
}

class NoParams {}

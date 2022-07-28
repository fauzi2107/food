import '../../../ui_export.dart';

/// Abtraction for use case with [Future] and [Result] return type.
///
/// This abtraction also avoiding multiple call if one call is on loading.
abstract class ResultUseCase<ReturnType, ParameterType> {
  var _isLoading = false;

  /// If disabled, it will show error when
  /// user call it more than once before loading
  /// is done.
  ///
  /// If you use Future.wait(), disable this.
  @protected
  bool enableLoading = true;

  /// Call this use case.
  Future<Result<ReturnType, Failure>> call(ParameterType params) async {
    if (_isLoading && enableLoading) {
      return Err(NoMessageFailure());
    }
    _isLoading = true;

    try {
      return await processCall(params);
    } catch (e, stackTrace) {
      return Err(
        await errorCatcher(
          e: e,
          stackTrace: stackTrace,
        ),
      );
    } finally {
      _isLoading = false;
    }
  }

  /// Process call method in abstraction.
  Future<Result<ReturnType, Failure>> processCall(ParameterType params);
}

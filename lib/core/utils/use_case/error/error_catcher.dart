import 'package:dio/dio.dart';

import 'failure.dart';
import 'http_error_catcher.dart';

/// Send exeption and stack trace to Firebase non fatal error.
/// Then, return [Failure].
Future<Failure> errorCatcher({
  required Object e,
  StackTrace? stackTrace,
  bool isUsingAgentCode = true,
  bool showWithStatusCode = true,
}) async {
  if (e is DioError) {
    await _recordDioError(e, stackTrace);
    return httpErrorCatcher(
      e,
      showWithStatusCode: showWithStatusCode,
    );
  }

  return UnknownFailure(e.toString());
}

/// Convert exception to [Failure].
Failure errorCatcherWithoutFirebase(Object e) {
  if (e is DioError) {
    return httpErrorCatcher(e);
  }

  return UnknownFailure(e.toString());
}

/// Send DioError (request and response) to
/// Firebase Crashlytics.
Future<void> _recordDioError(DioError e, StackTrace? stackTrace) async {
  final request = e.requestOptions.uri.toString();
  final requestData = e.requestOptions.data;
  final responseData = e.response?.data.toString();
}

import 'dart:io';

import 'package:dio/dio.dart';

import 'failure.dart';

part 'http_failure.dart';

/// Convert http error exception (like 400 status code, timeout),
/// to [HttpFailure] type.
///
/// [HttpFailure] is extended from [Failure].
///
/// Set [isConnectionAvailable] to true if connection is available.
Failure httpErrorCatcher(
  Object e, {
  bool showWithStatusCode = true,
  bool isConnectionAvailable = true,
}) {
  if (e is DioError) {
    final statusCode = e.response?.statusCode ?? 0;
    final responseData = e.response?.data;
    final error = e.error;

    /// Because of no connection already handle in `api_interceptors.dart`, we don't
    /// need another Failure to show error dialog.
    ///
    /// Just return NoMessageFailure to avoid show dialog.
    if (error is SocketException && isConnectionAvailable == false) {
      return NoMessageFailure();
    }

    /// If something error AND connection is available, show error.
    if (error is SocketException && isConnectionAvailable) {
      return MessageError(error.message);
    }

    if (responseData is String) {
      if (showWithStatusCode) {
        return MessageError("API $statusCode: $responseData");
      } else {
        return MessageError(responseData);
      }
    }

    if (responseData is Map<String, dynamic>) {
      final message = responseData["message"];
      if (message != null && message is String && message.isNotEmpty) {
        return MessageError(message);
      }

      final detail = responseData["detail"];
      if (detail != null && detail is String && detail.isNotEmpty) {
        return MessageError(detail);
      }
    }

    if (statusCode == 400) {
      return BadRequest();
    }

    if (statusCode == 401) {
      return Unauthorized();
    }

    if (statusCode == 403) {
      return Forbidden();
    }

    if (statusCode == 405) {
      return MethodNotAllowed();
    }

    if (statusCode == 408) {
      return RequestTimeout();
    }

    if (statusCode == 413) {
      return PayloadTooLarge();
    }

    if (statusCode == 422) {
      return InvalidError();
    }

    if (statusCode == 503) {
      return ServiceUnavailable();
    }

    // If another error 400
    if (statusCode >= 400 && statusCode < 500) {
      return ClientError(statusCode);
    }

    // If another error 500
    if (statusCode >= 500 && statusCode < 600) {
      return ServerError(statusCode);
    }

    if (e.type == DioErrorType.connectTimeout) {
      return ConnectTimeout(e.response?.requestOptions.connectTimeout ?? 0);
    }

    if (e.type == DioErrorType.sendTimeout) {
      return SendTimeout(e.response?.requestOptions.sendTimeout ?? 0);
    }

    if (e.type == DioErrorType.receiveTimeout) {
      return ReceiveTimeout(e.response?.requestOptions.receiveTimeout ?? 0);
    }

    if (e.type == DioErrorType.other) {
      return HttpOtherError(e.message.toString());
    }
  }

  return UnknownFailure(e.toString());
}

import 'package:dio/dio.dart';
import 'package:food/common/constant.dart';

/// A powerful Http client for Dart, which supports Interceptors,
/// Global configuration, FormData, Request Cancellation,
/// File downloading, Timeout etc.
Future<Dio> get myDio async {
  final _dio = Dio(BaseOptions(baseUrl: baseUrl));

  return _dio;
}

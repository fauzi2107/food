import 'package:dio/dio.dart';
import 'package:food/core/http_client/my_dio.dart';
import 'package:injectable/injectable.dart';

/// Register third party module.
///
/// You can register first party module without parameter dependency.
@module
abstract class RegisterModule {
  @preResolve
  Future<Dio> get dio => myDio;
}

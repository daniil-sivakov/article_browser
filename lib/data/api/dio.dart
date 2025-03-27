import 'package:article_browser/core/logging/logger.dart';
import 'package:article_browser/data/api/interceptors/logging_interceptor.dart';
import 'package:dio/dio.dart';

Dio createDio(Logger logger) {
  final Dio dio = Dio(BaseOptions(connectTimeout: Duration(seconds: 10)));

  dio.interceptors.addAll([LoggingInterceptor(logger)]);

  return dio;
}

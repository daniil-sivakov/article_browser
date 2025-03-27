import 'package:article_browser/core/logging/logger.dart';
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  final Logger _logger;

  const LoggingInterceptor(this._logger);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _log('${options.method} sent \n${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _log(
      '${response.requestOptions.method}: ${response.statusCode}\n${response.requestOptions.uri}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _log('*** Error ***');
    _log(
      '${err.requestOptions.method}: ${err.response?.statusCode}\n${err.requestOptions.uri}',
    );
    _log('Response: ${err.response}');
    super.onError(err, handler);
  }

  void _log(String message) => _logger.log(message);
}

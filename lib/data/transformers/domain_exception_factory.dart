import 'package:article_browser/domain/exceptions/exceptions.dart';
import 'package:dio/dio.dart';

class DomainExceptionFactory {
  DomainException createDomainException(DioException exception) {
    if (exception.response?.statusCode == 404) {
      return NoDataFoundException();
    }
    return RemoteHostNotReachedException();
  }
}

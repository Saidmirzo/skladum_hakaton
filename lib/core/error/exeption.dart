
import 'package:dio/dio.dart';
import 'package:skladum/core/error/failure.dart';

class ServerException implements Exception {}

class CacheException implements Exception {}

class DioExceptions implements Exception {
  DioExceptions();

  static Failure fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return const ConnectionFailure("Request to API server was cancelled");
      case DioExceptionType.connectionTimeout:
        return const ConnectionFailure("Connection timeout with API server");
      case DioExceptionType.receiveTimeout:
        return const ConnectionFailure(
            "Receive timeout in connection with API server");

      case DioExceptionType.sendTimeout:
        return const ConnectionFailure(
            "Send timeout in connection with API server");
      case DioExceptionType.badResponse:
        return handleError(
          dioError.response?.statusCode,
          dioError.response?.data["message"],
        );
      case DioExceptionType.connectionError:
        return  const ConnectionFailure("Connection error");
      case DioExceptionType.badCertificate:
        
        return  const BadResponceFailure("Bad certificate");
      case DioExceptionType.unknown:
        return  const UnknownFailure("Unknown error");
      default:
        return const UnknownFailure("Something went wrong");
    }
  }

  static Failure handleError(int? statusCode, String error) {
    switch (statusCode) {
      case 400:
        return BadResponceFailure(error);
      case 401:
        return UnautorizedFailure(error);
      case 403:
        return ForbiddenFailure(error);
      case 404:
        return UrlNotFoundFailure(error);
      case 500:
        return ServerFailure(error);
      case 502:
        return BadResponceFailure(error);
      default:
        return UnknownFailure(error);
    }
  }
}
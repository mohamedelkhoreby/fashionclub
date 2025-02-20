import 'package:dio/dio.dart';

import '../../presentation/resources/strings_manager.dart';
import '../../presentation/resources/values_manager.dart';
import 'failure.dart';

// Enum representing various types of data sources for errors
enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unAuthorised,
  badCertificate,
  notFound,
  internalServerError,
  connectionError,
  connectTimeOut,
  cancel,
  receiveTimeOut,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  unknown
}

// Custom error handler implementing Exception
class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // Handle errors originating from Dio or API response
      failure = _handleError(error);
    } else {
      // Default error handling
      failure = DataSource.noContent.getFailure();
    }
  }
}

// Function to handle Dio-specific errors and map to appropriate failures
Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeOut.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeOut.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeOut.getFailure();
    case DioExceptionType.badResponse:
      switch (error.response?.statusCode) {
        case ResponseCode.badRequest:
          return DataSource.badRequest.getFailure();
        case ResponseCode.forbidden:
          return DataSource.forbidden.getFailure();
        case ResponseCode.unAuthorised:
          return DataSource.unAuthorised.getFailure();
        case ResponseCode.notFound:
          return DataSource.notFound.getFailure();
        case ResponseCode.internalServerError:
          return DataSource.internalServerError.getFailure();
        default:
          return DataSource.unknown.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.unknown:
      return DataSource.unknown.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.badCertificate.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.connectionError.getFailure();
  }
}

// Extension to map DataSource to Failure with appropriate code and message
extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(
            ResponseCode.badRequest, ResponseMessage.badRequestError);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbiddenError);
      case DataSource.unAuthorised:
        return Failure(
            ResponseCode.unAuthorised, ResponseMessage.unauthorizedError);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFoundError);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataSource.connectTimeOut:
        return Failure(
            ResponseCode.connectTimeOut, ResponseMessage.connectTimeout);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.defaultError);
      case DataSource.receiveTimeOut:
        return Failure(
            ResponseCode.receiveTimeOut, ResponseMessage.receiveTimeout);
      case DataSource.sendTimeOut:
        return Failure(ResponseCode.sendTimeOut, ResponseMessage.timeoutError);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(
            ResponseCode.noInternetConnection, ResponseMessage.noInternetError);
      case DataSource.connectionError:
        return Failure(
            ResponseCode.connectionError, ResponseMessage.connectTimeout);
      case DataSource.badCertificate:
        return Failure(
            ResponseCode.badCertificate, ResponseMessage.badRequestError);
      default:
        return Failure(ResponseCode.unknown, ResponseMessage.unknownError);
    }
  }
}

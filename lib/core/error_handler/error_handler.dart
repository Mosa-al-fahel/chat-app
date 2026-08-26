import 'package:dio/dio.dart';
import 'package:whishing/core/error_handler/error_extension.dart';
import 'package:whishing/core/error_handler/error_model.dart';

class ApiErrorHandler {
  static ErrorModel handleError(error) {
    if (error is DioException) {
      switch (error.type) {
        case DioException.badResponse:
          return _handleResponseError(error);
        case DioExceptionType.badCertificate:
          return ErrorTypes.badCertificate.getFailure();
        case DioExceptionType.connectionError:
          return ErrorTypes.connectionError.getFailure();
        case DioExceptionType.connectionTimeout:
          return ErrorTypes.connectionTimeout.getFailure();
        case DioExceptionType.receiveTimeout:
          return ErrorTypes.receiveTimeout.getFailure();
        case DioExceptionType.sendTimeout:
          return ErrorTypes.sendTimeout.getFailure();
        case DioExceptionType.cancel:
          return ErrorTypes.cancelled.getFailure();
        case DioExceptionType.unknown:
          return ErrorTypes.unKnown.getFailure();

        default:
          return ErrorTypes.unKnown.getFailure();
      }
    } else {
      return ErrorTypes.unKnown.getFailure();
    }
  }
}

ErrorModel _handleResponseError(DioException error) {
  final responseData = error.response?.data;

  if (responseData != null && responseData is Map<String, dynamic>) {
    return ErrorModel.fromJson(responseData);
  }
 
  return ErrorModel(
    status: false,
    message: error.message ?? 'Unknown Error',
  );
}

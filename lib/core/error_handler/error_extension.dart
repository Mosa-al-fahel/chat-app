import 'package:whishing/core/error_handler/error_model.dart';

enum ErrorTypes {
  badCertificate,
  connectionError,
  connectionTimeout,
  receiveTimeout,
  sendTimeout,
  cancelled,
  unKnown
}

class MessagesError {
  static const String connectionTimeout =
      'Connection timed out, please check your internet';
  static const String cancelled = 'Request was cancelled';
  static const String receiveTimeout = 'Server is taking too long to respond';
  static const String sendTimeout = 'Failed to send data, please try again';
  static const String connectionError =
      'No internet connection, please check your network';
  static const String badCertificate =
      'Secure connection failed (Invalid Certificate)';
  static const String unKnown = 'Something went wrong, please try again';
}

extension DataSourceExtension on ErrorTypes {
  ErrorModel getFailure() {
    switch (this) {
      case ErrorTypes.badCertificate:
        return ErrorModel(message: MessagesError.badCertificate);
      case ErrorTypes.connectionError:
        return ErrorModel(message: MessagesError.connectionError);
      case ErrorTypes.connectionTimeout:
        return ErrorModel(message: MessagesError.connectionTimeout);
      case ErrorTypes.receiveTimeout:
        return ErrorModel(message: MessagesError.receiveTimeout);
      case ErrorTypes.cancelled:
        return ErrorModel(message: MessagesError.cancelled);
      case ErrorTypes.sendTimeout:
        return ErrorModel(message: MessagesError.sendTimeout);
      case ErrorTypes.unKnown:
        return ErrorModel(message: MessagesError.unKnown);
    }
  }
}

import 'package:whishing/core/error_handler/error_model.dart';

abstract class NotificationsRepository {
  Future<ApiResult<void>> sendFcmToken(
      {required String userId, required String fcmToken});
  Future<String?> getFcmToken();
  Stream<String> get syncFcmToken;
  Future<void>clearFcmToken();
}

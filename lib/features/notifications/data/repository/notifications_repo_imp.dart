import 'package:whishing/core/error_handler/error_handler.dart';
import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/core/services/notifications/firebase/fcm_firebase.dart';
import 'package:whishing/features/notifications/data/model/fcm_token_body.dart';
import 'package:whishing/features/notifications/data/sources/fcm_remote_data_source.dart';
import 'package:whishing/features/notifications/domain/repository/notifications_repository.dart';

class NotificationsRepoImp extends NotificationsRepository {
  NotificationsRepoImp(this.remoteDataSource, this.fcmServices);
  final SyncFcmTokenRemoteDataSource remoteDataSource;
  final FBFcmServices fcmServices;
  @override
  Future<ApiResult<void>> sendFcmToken(
      {required String userId, required String fcmToken}) async {
    try {
      final SendFcmTokenBody syncFcmbody =
          SendFcmTokenBody(fcmToken: fcmToken, userId: userId);
      await remoteDataSource.syncFcmToken(syncFcmbody);
      return ApiSuccess(null);
    } catch (error) {
      print("your error iiiiiii");
      print(error);
      print("your error iiiiiii");
      print(error.toString());
      return ApiFailure(ApiErrorHandler.handleError(error));
    }
  }

  @override
  Stream<String> get syncFcmToken => fcmServices.getRefreshedToken;

  @override
  Future<String?> getFcmToken() async {
    return await fcmServices.getToken();
  }

  @override
  Future<void> clearFcmToken() async {
    await fcmServices.clearToken();
  }
}

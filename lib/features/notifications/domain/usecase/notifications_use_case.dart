import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/core/services/notifications/local_notifications.dart';
import 'package:whishing/features/notifications/domain/repository/notifications_repository.dart';

class NotificationsUseCase {
  NotificationsUseCase(this.repo);
  StreamSubscription<String>? subscriptionForTokenRefresh;
  final NotificationsRepository repo;
  Future<ApiResult<void>?> sendFcmToken({String? userId}) async {
    String? fcmToken = await repo.getFcmToken();
    print(fcmToken);
    if (fcmToken != null && userId != null) {
      return await repo.sendFcmToken(fcmToken: fcmToken, userId: userId);
    }
    return null;
  }

  void listenToRefreshToken(String? userId) {
    subscriptionForTokenRefresh?.cancel();
    subscriptionForTokenRefresh = repo.syncFcmToken.listen((newToken) async {
      if (userId != null) {
        print(newToken);
        await repo.sendFcmToken(userId: userId, fcmToken: newToken);
      }
    });
  }

  void initForegroundNotifications() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;

      if (notification != null) {
        PushlocalNotifications.showNotification(
          id: message.hashCode,
          title: notification.title ?? 'message recieved ',
          body: notification.body ?? '',
          payload: message.data['senderId'],
        );
      }
    });
  }

  Future<void>clearFcmToken() async {
    await repo.clearFcmToken();
  }
}

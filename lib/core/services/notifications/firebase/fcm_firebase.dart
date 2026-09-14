//DIRECT CONTACT WITH FIREBASE
import 'package:firebase_messaging/firebase_messaging.dart';

class FBFcmServices {
  static final FBFcmServices _instance = FBFcmServices._internal();
  factory FBFcmServices() => _instance;
  FBFcmServices._internal();

  String? tokem;
  static final FirebaseMessaging _fcmService = FirebaseMessaging.instance;
  Future<void> clearToken() async {
    await _fcmService.deleteToken();
  }

  Future<String?> getToken() async {
    NotificationSettings settings = await _fcmService.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('حالة الصلاحية: ${settings.authorizationStatus}');
      return await _fcmService.getToken();
    } else {
      return null;
    }
  }

   
  Stream<String> get getRefreshedToken => _fcmService.onTokenRefresh;
}

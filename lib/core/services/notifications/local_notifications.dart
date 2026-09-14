import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushlocalNotifications {
  static String? currentsSender;
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlatform = FlutterLocalNotificationsPlugin();

  static Future<void> init(
      {required Function(String? payload) onNotificationTap}) async {
    AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    InitializationSettings settings =
        InitializationSettings(android: androidSettings, iOS: iosSettings);

    await _flutterLocalNotificationsPlatform.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        final String? payload = response.payload;

        onNotificationTap(payload);
      },
    );
    await _createHighImportanceChannel();
  }

  static Future<void> _createHighImportanceChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      "chatChannelId",
      "chatChannelName",
      description: 'channel for displaying chat messages',
      importance: Importance.high,
    );

    await _flutterLocalNotificationsPlatform
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails("chatChannelId", "chatChannelName",
            channelDescription: 'channel for displaying chat messages',
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher');

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );

    await _flutterLocalNotificationsPlatform.show(
        id: id,
        body: body,
        title: title,
        payload: payload,
        notificationDetails: platformChannelSpecifics);
  }

  static void initForegroundNotifications() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      final sender = message.data['_id'];

      if (notification != null) {
        if (currentsSender != sender) {
          showNotification(
            id: message.hashCode,
            title: notification.title ?? 'رسالة جديدة',
            body: notification.body ?? '',
            payload: message.data['_id'],
          );
        } else {
          return;
        }
      }
    });
  }
}

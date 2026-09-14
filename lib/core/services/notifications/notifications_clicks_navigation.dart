import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:whishing/core/data/model/user_model.dart';
import 'package:whishing/core/routing/routs.dart';

class NotificationNavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void init() {
    _handleInitialMessage();
    _handleBackgroundMessageOpened();
  }

  static Future<void> _handleInitialMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _executeNavigation(initialMessage);
      });
    }
  }

  static void _handleBackgroundMessageOpened() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _executeNavigation(message);
    });
  }

  static void _executeNavigation(RemoteMessage message) {
    print('Clicked');

    final userModel = UserModel.fromJson(message.data);
    print("$userModel ${userModel.id}");
    if (userModel.id != null) {
      navigatorKey.currentState?.pushNamed(
        AppRoutes.chat,
        arguments: userModel,
      );
    }
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:whishing/core/data/local/cashed_user_data.dart';
import 'package:whishing/core/data/model/user_model.dart';
import 'package:whishing/core/di/dependency_injection.dart';
import 'package:whishing/core/helper/shared_prefrences.dart';
import 'package:whishing/core/network/socket/connet_to_socket.dart';
import 'package:whishing/core/routing/myrouting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/routing/routs.dart';
import 'package:whishing/core/services/notifications/local_notifications.dart';
import 'package:whishing/core/services/notifications/notifications_clicks_navigation.dart';
import 'package:whishing/core/themes/theme.dart';
import 'package:whishing/features/chat/data/model/message_model.dart';
import 'package:whishing/features/notifications/domain/usecase/notifications_use_case.dart';
import 'package:whishing/core/services/notifications/firebase/firebase_options.dart';
import 'package:whishing/themes_cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationNavigationService.init();
  await SharedPreference.initializeSharedPerefrnce();
  configureDependencies();
  await GetUserCashedData.initUser();
  await isTokenValidate();
  await Hive.initFlutter();
  PushlocalNotifications.initForegroundNotifications();
  connectSocketAndRefreshToken();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(MessageModelAdapter());
  runApp(BlocProvider(
    create: (context) => ThemeCubit(GetUserCashedData.isItDark),
    child: MyApp(rout: MyRouting()),
  ));
}

class MyApp extends StatelessWidget {
  final MyRouting rout;
  const MyApp({super.key, required this.rout});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, theme) {
            return MaterialApp(
              navigatorKey: NotificationNavigationService.navigatorKey,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: theme,
              debugShowCheckedModeBanner: false,
              initialRoute:
                  _userToken == false ? AppRoutes.signUp : AppRoutes.home,
              onGenerateRoute: rout.onRouting,
            );
          },
        ));
  }
}

bool _userToken = false;
void connectSocketAndRefreshToken() {
  String? currentUserId = GetUserCashedData.userId;
  if (currentUserId != null && currentUserId.isNotEmpty) {
    print(currentUserId);
    ConnectToSocket.connectSocket(currentUserId);
    getIt<NotificationsUseCase>().listenToRefreshToken(currentUserId);
  } else {}
}

Future<void> isTokenValidate() async {
  String? taoken = GetUserCashedData.getUserToken;
  if (taoken != null) {
    _userToken = true;
  } else {
    _userToken = false;
  }
}

// id of user1
//6a3c43dea4fbb2b862dee11f
// id of user 2
//6a3c440ea4fbb2b862dee120
//token of user 2
//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2YTNjNDQwZWE0ZmJiMmI4NjJkZWUxMjAiLCJpYXQiOjE3ODIzMzQ0NzgsImV4cCI6MTc4NDkyNjQ3OH0.u9POZ2qy-NI5qkNdL6L5ed7-AgKQu9DU2btAT4cHArU

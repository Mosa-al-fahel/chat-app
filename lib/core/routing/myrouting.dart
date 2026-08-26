import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whishing/core/di/dependency_injection.dart';
import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/routing/routs.dart';
import 'package:whishing/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:whishing/features/chat/presentation/screens/chat.dart';
import 'package:whishing/features/friendship_requests/presentation/cubit/requests_cubit.dart';
import 'package:whishing/features/friendship_requests/presentation/screen/requests_screen.dart';
import 'package:whishing/features/home/presentation/cubit/home_page_cubit.dart';
import 'package:whishing/features/home/presentation/screens/explore_people.dart';
import 'package:whishing/features/home/presentation/screens/home.dart';
import 'package:whishing/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:whishing/features/auth/login/presentation/screens/login.dart';
import 'package:whishing/features/auth/signup/presentation/cubit/sign_up_cubit.dart';
import 'package:whishing/features/auth/signup/presentation/screens/sign_up_screen.dart';

class MyRouting {
  Route onRouting(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.signUp:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => getIt<SignUpCubit>(),
                child: const SignUpScreen()));

      case AppRoutes.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case AppRoutes.home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => getIt<HomePageCubit>()
                    ..exploreFriends()
                    ..disPlayContants(),
                  child: const HomeScreen(),
                ));
      case AppRoutes.chat:
        final user = setting.arguments as UserEntity;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<ChatCubit>()..initChat(user.id!),
                  child: ChatScreen(
                    userData: user,
                  ),
                ));
      case AppRoutes.requests:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (_) => getIt<RequestsCubit>()..getRequests(),
                  child: const RequestsScreen(),
                ));
      // case AppRoutes.profile:
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider(
      //             create: (_) => getIt<RequestsCubit>()..getRequests(),
      //             child: const RequestsScreen(),
      //           ));
      case AppRoutes.exploreFriends:
    //    final List<UserEntity> userList = setting.arguments as List<UserEntity>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<HomePageCubit>()..exploreFriends(),
            // child:   ExplorePeopleScreen(suggustedUsers: userList),
            child:   ExplorePeopleScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('No Routes'),
                  ),
                ));
    }
  }
}

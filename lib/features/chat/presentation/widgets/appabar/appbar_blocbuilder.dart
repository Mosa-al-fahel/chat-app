import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whishing/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:whishing/features/chat/presentation/widgets/appabar/chat_appbar.dart';

class AppbaraBlocBuilder extends StatelessWidget {
  const AppbaraBlocBuilder(
      {super.key, required this.userName, required this.userAvatar});
  final String userName;
  final String userAvatar;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(buildWhen: (previous, current) {
      if (current is ChatLoaded && previous is ChatLoaded) {
        return previous.typing != current.typing;
      }
      return true;
    }, builder: (context, state) {
      if (state is ChatLoaded) {
        return customBar(
            isTyping: state.typing,
            context: context,
            userName: userName,
            userPhoto: userAvatar);
      }
      {
        return customBar(
            isTyping: false,
            context: context,
            userName: userName,
            userPhoto: userAvatar);
      }
    });
  }
}

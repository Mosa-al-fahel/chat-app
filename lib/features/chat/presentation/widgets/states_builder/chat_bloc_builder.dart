import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whishing/core/widgets/states/dialog_display.dart';
import 'package:whishing/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:whishing/features/chat/presentation/widgets/messages_list.dart';
import 'package:whishing/features/chat/presentation/widgets/states_builder/empty_chat.dart';

class ChatBlocBuilder extends StatelessWidget {
  const ChatBlocBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      buildWhen: (previous, current) {
        if (current is ChatLoaded && previous is ChatLoaded) {
          return current.messages.length != previous.messages.length;
        }
        return true;
      },
      builder: (context, state) {
        if (state is ChatEmpy) {
          return setupEmptyChat();
        }
        if (state is ChatLoaded) {
          return MessagesList(
              messages: state.messages,
              myId: context.read<ChatCubit>().userIdForChat);
        }
        if (state is ChatFailure) {
          return ListView(children: [
            GlobalDialogDisplay(text: state.errorMessage, isItError: true)
          ]);
        }
        if (state is ChatLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const Text('data');
      },
    );
  }
}

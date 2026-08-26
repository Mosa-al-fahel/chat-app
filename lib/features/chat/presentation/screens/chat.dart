import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:whishing/features/chat/presentation/widgets/appabar/appbar_blocbuilder.dart';
import 'package:whishing/features/chat/presentation/widgets/chat_text_field.dart';
import 'package:whishing/features/chat/presentation/widgets/states_builder/chat_bloc_builder.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.userData});
  final UserEntity userData;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    return Scaffold(
         resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AppbaraBlocBuilder(
              userName: userData.username!, userAvatar: userData.avatar!),
        ),
        body: Form(
          key: cubit.key,
          child: Column(children: [
            const Expanded(child: ChatBlocBuilder()),
            ChatTextField(
                onChanged: (X) => cubit.chatTypingState(userData.id!),
                controller: cubit.messageContent,
                onTap: () => cubit.sendMessage(userData.id!)),
          ]),
        ));
  }
}

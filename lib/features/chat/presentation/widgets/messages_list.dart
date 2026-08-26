import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whishing/features/chat/domain/enitities/message_entity.dart';
import 'package:whishing/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:whishing/features/chat/presentation/widgets/message_structure.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({super.key, required this.messages, required this.myId});
  final List<MessageEntity> messages;
  final String? myId;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async =>
          await context.read<ChatCubit>().initChat(messages.first.receiverId!),
      child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: context.read<ChatCubit>().scrollController,
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final bool isMe = myId == messages[index].senderId;
            final reversedMessages = messages.reversed.toList();
            return MessageStructure(
                isMe: isMe, message: reversedMessages[index].text);
          }),
    );
  }
}

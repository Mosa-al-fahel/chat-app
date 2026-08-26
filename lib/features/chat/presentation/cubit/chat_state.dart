part of 'chat_cubit.dart';

// enum ChatEmitStates {
//   initial,
//   loading,
//   empty,
//   succes,
//   failure,
// }

// class ChateStates {
//   final ChatEmitStates getMessagesState;
//  }

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}

final class ChatEmpy extends ChatState {}

final class ChatLoaded extends ChatState {
  ChatLoaded( {this.messages = const[] , this.typing = false});
  final List<MessageEntity> messages;
  final bool typing;
  ChatLoaded copyWith({List<MessageEntity>? messages, bool? typing}) {
  return ChatLoaded(messages: messages??this.messages, typing: typing?? this.typing);
}
}



final class ChatFailure extends ChatState {
  ChatFailure(this.errorMessage);
  final String errorMessage;
}

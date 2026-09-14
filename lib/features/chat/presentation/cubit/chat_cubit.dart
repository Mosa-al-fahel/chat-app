import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whishing/core/data/local/cashed_user_data.dart';
import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/core/services/notifications/local_notifications.dart';
import 'package:whishing/features/chat/domain/enitities/message_entity.dart';
import 'package:whishing/features/chat/domain/usecases/get_messages.dart';
import 'package:whishing/features/chat/domain/usecases/listen_to_messages.dart';
import 'package:whishing/features/chat/domain/usecases/listen_to_typing.dart';
import 'package:whishing/features/chat/domain/usecases/send_message.dart';
import 'package:whishing/features/chat/domain/usecases/send_typing_state.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(
      {required this.trackingTypingUseCase,
      required this.sendMessageUseCase,
      required this.getMessagesUseCase,
      required this.listenToMessagesUseCase,
      required this.sendTypingStateUseCase})
      : super(ChatInitial());
  final String _userId = GetUserCashedData.userId!;
  final SendMessageUseCase sendMessageUseCase;
  final GetMessagesUseCase getMessagesUseCase;
  final ListenToMessagesUseCase listenToMessagesUseCase;
  final ListenToTypingUseCase trackingTypingUseCase;
  final SendTypingStateUseCase sendTypingStateUseCase;
  final List<MessageEntity> _temporaryMessages = [];
  final ScrollController scrollController = ScrollController();
  static List<MessageEntity> lastMessaeges = const [];
  TextEditingController messageContent = TextEditingController();
  StreamSubscription<MessageEntity>? _messageSubscription;
  StreamSubscription<bool>? _typingTrackingSubscription;
  Timer? _timer;
  bool _istypingNow = false;
  String get userIdForChat => _userId;

  GlobalKey<FormState> key = GlobalKey<FormState>();
  void scrollToLowest() {
    if (scrollController.hasClients) {
      scrollController.animateTo(scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeInExpo);
    }
  }

  Future<void> initChat(String receiverId) async {
    PushlocalNotifications.currentsSender = receiverId;
    emit(ChatLoading());
    _messageSubscription =
        listenToMessagesUseCase.listenToMessages().listen((messageEntity) {
      if (state is ChatLoaded) {
        List<MessageEntity> currentMessages = (state as ChatLoaded).messages;
        emit(ChatLoaded(messages: [...currentMessages, messageEntity]));
      } else if (state is ChatEmpy) {
        final List<MessageEntity> firstMessages = [messageEntity];
        emit(ChatLoaded(messages: firstMessages));
      } else {
        _temporaryMessages.add(messageEntity);
      }
    });
    final response = await getMessagesUseCase.call(_userId, receiverId);
    switch (response)  {
      case ApiSuccess(data: var messages):
        List<MessageEntity> allMessages = [...messages, ..._temporaryMessages];
        _temporaryMessages.clear();
        if (allMessages.isNotEmpty) {
          if (isClosed) return;
          emit(ChatLoaded(messages: allMessages));
        } else {
          emit(ChatEmpy());
        }
      case ApiFailure(error: var error):
        if (isClosed) return;
        emit(ChatFailure(error.message!));
    }
    _typingTrackingSubscription =
        trackingTypingUseCase.listenToTypingStream().listen((typingNow) {
      if (state is ChatLoaded) {
        final currentState = (state as ChatLoaded);
        emit(currentState.copyWith(typing: typingNow));
      }
    });
  }

  bool _isTyping() {
    return messageContent.text.isNotEmpty;
  }

  Future<void> chatTypingState(String receiverId) async {
    final bool typingStatus = _isTyping();
    if (typingStatus && !_istypingNow) {
      _istypingNow = true;
      final response = await sendTypingStateUseCase.call(
          reciverId: receiverId, typing: true, senderId: _userId);
      switch (response) {
        case ApiSuccess():
          break;
        case ApiFailure():
      }
    }
    _timer?.cancel();
    Timer(const Duration(milliseconds: 1600), () async {
      _istypingNow = false;
      final response = await sendTypingStateUseCase.call(
          reciverId: receiverId, typing: false, senderId: _userId);

      switch (response) {
        case ApiSuccess():
          break;
        case ApiFailure():
      }
    });
  }

  Future<void> sendMessage(String receiverId) async {
    MessageEntity aText = MessageEntity(
        text: messageContent.text, receiverId: receiverId, senderId: _userId);
    final response = await sendMessageUseCase.call(messageContent: aText);

    switch (response) {
      case ApiSuccess():
        messageContent.clear();
        scrollToLowest();
      case ApiFailure():
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    _timer?.cancel();
    _messageSubscription?.cancel();
    _typingTrackingSubscription?.cancel();
    messageContent.dispose();
    PushlocalNotifications.currentsSender = null;
    return super.close();
  }
}

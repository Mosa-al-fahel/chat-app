import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/features/chat/domain/enitities/message_entity.dart';

abstract class ChatRepository {
  Stream<MessageEntity> get messageStream;
  Stream<bool> get typingStream;
  Future<ApiResult<List<MessageEntity>>> getMessages(
      {required String senderId, required String receiverId});
  Future<ApiResult<void>> sendMessage({required MessageEntity messageContent});
  Future<ApiResult<void>> sendTypingState(
      {required String reciverId,
      required String senderId,
      required bool typing});
}

import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/features/chat/domain/enitities/message_entity.dart';
import 'package:whishing/features/chat/domain/repositories/chat_repository.dart';

class GetMessagesUseCase {
  final ChatRepository chatRepo;
  GetMessagesUseCase(this.chatRepo);
  Future<ApiResult<List<MessageEntity>>> call(
      String senderId, String receiverId) async {
    return await chatRepo.getMessages(
        senderId: senderId, receiverId: receiverId);
  }

}

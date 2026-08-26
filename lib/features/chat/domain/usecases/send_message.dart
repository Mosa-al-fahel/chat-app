import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/features/chat/domain/enitities/message_entity.dart';
import 'package:whishing/features/chat/domain/repositories/chat_repository.dart';

class SendMessageUseCase {
  final ChatRepository chatRepo;
  SendMessageUseCase(this.chatRepo);
  Future<ApiResult<void>> call({required MessageEntity messageContent}) async {
    // if (messageContent.text.isNotEmpty){}
    return await chatRepo.sendMessage(messageContent: messageContent);
  }
}

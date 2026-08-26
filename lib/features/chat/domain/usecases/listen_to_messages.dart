import 'package:whishing/features/chat/domain/enitities/message_entity.dart';
import 'package:whishing/features/chat/domain/repositories/chat_repository.dart';

class ListenToMessagesUseCase {
  final ChatRepository repo;
  ListenToMessagesUseCase(this.repo);
  Stream<MessageEntity> listenToMessages() => repo.messageStream;
}

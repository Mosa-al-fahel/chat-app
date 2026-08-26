import 'package:whishing/features/chat/domain/repositories/chat_repository.dart';

class ListenToTypingUseCase {
  ListenToTypingUseCase(this.repo);
  final ChatRepository repo;
 Stream<bool>  listenToTypingStream() => repo.typingStream;
}

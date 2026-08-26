import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/features/chat/domain/repositories/chat_repository.dart';

class SendTypingStateUseCase {
  final ChatRepository repo;
  SendTypingStateUseCase(this.repo);

  Future<ApiResult<void>> call({required String reciverId,required String senderId,required bool typing}) async {
    return repo.sendTypingState(reciverId:  reciverId,senderId: senderId ,typing: typing);
  }
}

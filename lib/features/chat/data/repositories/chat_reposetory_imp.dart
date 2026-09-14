import 'package:whishing/core/data/local/hive_local_services.dart';
import 'package:whishing/core/error_handler/error_handler.dart';
import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/features/chat/data/model/message_model.dart';
import 'package:whishing/features/chat/data/sources/remote/chat_remote_data_source.dart';
import 'package:whishing/features/chat/data/sources/remote/socket_connect.dart';
import 'package:whishing/features/chat/domain/enitities/message_entity.dart';
import 'package:whishing/features/chat/domain/repositories/chat_repository.dart';

class ChatReposetorysImp implements ChatRepository {
  final ChatRemoteDataSource remoteDataApi;
  final SocketService socketService;
  final HiveLocalServices<MessageModel> hiveLocalServies;
  ChatReposetorysImp(
      this.remoteDataApi, this.socketService, this.hiveLocalServies);

  @override
  Future<ApiResult<List<MessageEntity>>> getMessages(
      {required String senderId, required String receiverId}) async {
    List<String> ids = [senderId, receiverId];
    ids.sort();
    String chatKey = 'chat_${ids[0]}_${ids[1]}';
    try {
      final response = await remoteDataApi.getMessages(
          senderId: senderId, receiverId: receiverId);
      await hiveLocalServies.storeListOfData(chatKey, response);
      return ApiResult.success(response);
    } catch (error) {
      try {
        final List<MessageModel> localMessages =
            await hiveLocalServies.getStoredList(chatKey);
        if (localMessages.isNotEmpty) {
          return ApiResult.success(localMessages);
        }
      } catch (_) {}
      return ApiResult.failed(ApiErrorHandler.handleError(error));
    }
  }

  @override
  Stream<MessageEntity> get messageStream {
    return socketService.messageStream.map((messageModel) {
      final String receiverId = messageModel.receiverId!;
      final String senderId = messageModel.senderId!;
      List<String> ids = [senderId, receiverId];
      ids.sort();
      String chatKey = 'chat_${ids[0]}_${ids[1]}';
      hiveLocalServies.cacheSingleMessage(chatKey, messageModel);
      return messageModel.toEntity();
    });
  }

  @override
  Future<ApiResult<void>> sendMessage(
      {required MessageEntity messageContent}) async {
    try {
      final model = MessageModel(
        receiverId: messageContent.receiverId,
        senderId: messageContent.senderId,
        text: messageContent.text,
      );
      socketService.emitMessage(model);

      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failed(ApiErrorHandler.handleError(error));
    }
  }

  @override
  Stream<bool> get typingStream => socketService.typingStream;

  @override
  Future<ApiResult<void>> sendTypingState(
      {required String reciverId,
      required String senderId,
      required bool typing}) async {
    try {
      
      socketService.emitTyping(reciverId, senderId, typing);
      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failed(ApiErrorHandler.handleError(error));
    }
  }
}

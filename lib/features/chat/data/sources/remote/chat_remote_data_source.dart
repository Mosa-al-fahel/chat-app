import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:whishing/core/constants/api_url.dart';
 import 'package:whishing/features/chat/data/model/message_model.dart';
part 'chat_remote_data_source.g.dart';

@RestApi()
abstract class ChatRemoteDataSource {
  factory ChatRemoteDataSource(Dio dio, {String? baseUrl}) =
      _ChatRemoteDataSource;
  @GET('${ApiUrls.chatMessages}{senderId}/{receiverId}')
  Future<List<MessageModel>> getMessages({
    @Path('senderId') required String senderId,
    @Path('receiverId') required String receiverId,
  });
}

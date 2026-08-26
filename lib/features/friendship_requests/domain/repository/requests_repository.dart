import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/error_handler/error_model.dart';

abstract class RequestsRepository {
  Future<ApiResult<List<UserEntity>>> getSentRequests();
  Future<ApiResult<void>> acceptFriendRequest({ required String senderId});
}

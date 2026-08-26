import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/features/friendship_requests/data/repository/requests_repository_imp.dart';

class RequestsUsecase {
  RequestsUsecase(this.reqrepositoryImp);
  final RequestsRepositoryImp reqrepositoryImp;
  Future<ApiResult<List<UserEntity>>> call() async {
    return await reqrepositoryImp.getSentRequests();
  }

  Future<ApiResult<void>> acceptFriendRequest({required String  senderId}) async {
    return await reqrepositoryImp.acceptFriendRequest(senderId: senderId);
  }
}

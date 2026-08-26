import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/error_handler/error_handler.dart';
import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/features/friendship_requests/data/sources/remote_data_source.dart';
import 'package:whishing/features/friendship_requests/domain/repository/requests_repository.dart';

class RequestsRepositoryImp implements RequestsRepository {
  final RequestsRemoteDataSources remoteDataSources;
  RequestsRepositoryImp(this.remoteDataSources);
  @override
  Future<ApiResult<List<UserEntity>>> getSentRequests() async {
    try {
      final response = await remoteDataSources.geMytRequests();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failed(ApiErrorHandler.handleError(error));
    }
  }

  @override
  Future<ApiResult<void>> acceptFriendRequest({required  String senderId}) async {
    try {
      await remoteDataSources.acceptFriendRequest(  senderId:senderId );
      return ApiResult.success(null);
    } catch (error) {
      return ApiResult.failed(ApiErrorHandler.handleError(error));
    }
  }
}

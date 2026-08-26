import 'package:whishing/core/constants/strings.dart';
import 'package:whishing/core/data/local/hive_local_services.dart';
import 'package:whishing/core/data/model/user_model.dart';
import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/error_handler/error_handler.dart';
import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/features/home/data/sources/remote/home_remote_data.dart';
import 'package:whishing/features/home/domain/repositories/home_repository.dart';

class HomeRepoImp implements HomeRepository {
  final HomeRemoteData remoteData;
  final HiveLocalServices<UserModel> hiveServices;
  HomeRepoImp(this.remoteData, this.hiveServices);

  @override
  Future<ApiResult<List<UserEntity>>> explorePeople() async {
    try {
      final response = await remoteData.explorePeople();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failed(ApiErrorHandler.handleError(error));
    }
  }
  @override
  Future<ApiResult<List<UserEntity>>> displayFirends() async {
    try {
      final response = await remoteData.displayFreinds();
      await hiveServices.storeListOfData(
          StringsConstants.contactsStorageKey, response);

      return ApiResult.success(response);
    } catch (error) {
      try {
        final List<UserModel> localStoredContacts = await hiveServices
            .getStoredList(StringsConstants.contactsStorageKey);
        if (localStoredContacts.isNotEmpty) {
          return ApiResult.success(localStoredContacts);
        }
      } catch (_) {}
      return ApiResult.failed(ApiErrorHandler.handleError(error));
    }
  }

  @override
  Future<ApiResult<void>> addFriend(String friendId) async {
    try {
      final response = await remoteData.addFriend(friendId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failed(ApiErrorHandler.handleError(error));
    }
  }

  @override
  Future<ApiResult<void>> removeFriend() {
    throw UnimplementedError();
  }
}

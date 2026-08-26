import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/error_handler/error_model.dart';

abstract class HomeRepository {
  Future<ApiResult<List<UserEntity>>> explorePeople();
  Future<ApiResult<List<UserEntity>>> displayFirends();
  Future<ApiResult<void>> addFriend(String friendId);
  Future<ApiResult<void>> removeFriend();
}
 
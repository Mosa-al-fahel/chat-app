 import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/error_handler/error_model.dart';
 
abstract class SignUpRepository {
  Future<ApiResult<UserEntity>> signUp(
      {required String userName,
      required String email,
      required String password});
}

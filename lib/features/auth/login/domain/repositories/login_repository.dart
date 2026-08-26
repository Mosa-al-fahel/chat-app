import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/features/auth/login/domain/entites/login_entity.dart';

abstract class LoginRepository {
  Future<ApiResult<LoginEntity>> login({required String email, required String password});
}

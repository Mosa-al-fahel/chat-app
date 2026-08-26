import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/features/auth/login/domain/entites/login_entity.dart';
import 'package:whishing/features/auth/login/domain/repositories/login_repository.dart';

class LoginUsecase {
  final LoginRepository loginRepo;
  LoginUsecase(this.loginRepo);
  Future<ApiResult<LoginEntity>> call(
      {required email, required password}) async{
    return await loginRepo.login(email: email, password: password);
  }
}

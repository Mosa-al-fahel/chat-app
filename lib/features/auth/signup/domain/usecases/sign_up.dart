import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/error_handler/error_model.dart';
 import 'package:whishing/features/auth/signup/domain/repositories/sign_up.dart';

class SignUpUseCase {
  final SignUpRepository signupRepo;
  SignUpUseCase(this.signupRepo);
  Future<ApiResult<UserEntity>> call(
      {required String email, required password, required userName}) async {
    return await signupRepo.signUp(
        email: email, password: password, userName: userName);
  }
}

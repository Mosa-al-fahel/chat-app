import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/error_handler/error_handler.dart';
import 'package:whishing/core/error_handler/error_model.dart';
 import 'package:whishing/features/auth/signup/data/model/sign_up_body.dart';
import 'package:whishing/features/auth/signup/data/sources/sign_up_local_data.dart';
import 'package:whishing/features/auth/signup/data/sources/sign_up_remote_data.dart';
import 'package:whishing/features/auth/signup/domain/repositories/sign_up.dart';

class SignUpRepositoryImp implements SignUpRepository {
  final SignUpRemoteData signUpRemoteData;
  SignUpRepositoryImp(this.signUpRemoteData);
  @override
  Future<ApiResult<UserEntity>> signUp({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      final signupBody =
          SignUpBody(userName: userName, email: email, password: password);
      final response = await signUpRemoteData.signup(signupBody);

      await SignUpLocalData.cachedUserData(response);
       return ApiResult.success(response.user!);
    } catch (error) {
      return ApiResult.failed(ApiErrorHandler.handleError(error));
    }
  }
}

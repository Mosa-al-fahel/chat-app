import 'package:whishing/core/error_handler/error_handler.dart';
import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/features/auth/login/data/model/login_body_model.dart';
import 'package:whishing/features/auth/login/data/sources/local/store_user_id.dart';
import 'package:whishing/features/auth/login/data/sources/remote/login_remote_data.dart';
import 'package:whishing/features/auth/login/domain/entites/login_entity.dart';
import 'package:whishing/features/auth/login/domain/repositories/login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginRemoteData loginRemoteData;
  LoginRepositoryImp(this.loginRemoteData);
  @override
  Future<ApiResult<LoginEntity>> login(
      {required String email, required String password}) async {
    try {
      final loginBody = LoginBodyModel(email: email, password: password);
      final response = await loginRemoteData.login(loginBody);
      final String id = response.id;
      final String token = response.token;
      await CashedUserId.storeUserId(id);
      await CashedUserId.storeUserToken(token);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failed(ApiErrorHandler.handleError(error));
    }
  }
}

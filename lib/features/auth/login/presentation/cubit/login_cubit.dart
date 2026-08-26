import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:whishing/core/data/local/cashed_user_data.dart';
import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/core/network/socket/connet_to_socket.dart';
import 'package:whishing/features/auth/login/domain/usecase/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.useCase) : super(LoginInitial());
  final LoginUsecase useCase;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<void> emitLogin() async {
    emit(LoginLoading());
    final response =
        await useCase.call(email: email.text, password: password.text);
    switch (response) {
      case ApiSuccess(data: var data):
        await GetUserCashedData.initUser();
        email.clear();
        password.clear();
        final String userID = data.id;
        ConnectToSocket.connectSocket(userID);
        emit(LoginSuccess());
      case ApiFailure(error: var error):
        emit(LoginFailure(error));
    }
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whishing/core/data/local/cashed_user_data.dart';
import 'package:whishing/core/error_handler/error_model.dart';
import 'package:whishing/core/network/socket/connet_to_socket.dart';
import 'package:whishing/features/auth/signup/domain/usecases/sign_up.dart';

part 'sign_up_state.dart';

// messi@gmail.com
// messilover
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.useCase) : super(SignUpInitial());
  final SignUpUseCase useCase;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<void> emitSignUp() async {
    emit(SignUpLoading());
    final response = await useCase.call(
        email: email.text, password: password.text, userName: userName.text);
    switch (response) {
      case ApiSuccess(data: var data):
       await GetUserCashedData.initUser();
        userName.clear();
        email.clear();
        password.clear();
        final String id = data.id!;
        ConnectToSocket.connectSocket(id);
        emit(SignUpSuccess());
      case ApiFailure(error: var error):
        print('');
        emit(SignUpFailure(error));
    }
  }

  @override
  Future<void> close() {
    userName.dispose();
    email.dispose();
    password.dispose();
    return super.close();
  }
}

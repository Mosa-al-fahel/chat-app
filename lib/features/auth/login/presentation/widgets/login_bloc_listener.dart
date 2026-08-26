import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whishing/core/helper/extenstion.dart';
import 'package:whishing/core/routing/routs.dart';
import 'package:whishing/core/themes/colors.dart';
import 'package:whishing/core/widgets/states/dialog_display.dart';
import 'package:whishing/features/auth/login/presentation/cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            _disPlayLoading(context);
          }
          if (state is LoginSuccess) {
            context.pop((false));
            context.pushReplacementNamed(AppRoutes.home);
          }
          if (state is LoginFailure) {
            context.pop((false));
            _disPlayFailure(context: context, text: state.errorText.message!);
          }
        },
        child: const SizedBox.shrink());
  }
}

void _disPlayLoading(BuildContext context) {
  return displayDialog(
      context: context,
      widget: const Center(
          child: CircularProgressIndicator(
        color: AppColors.ordinaryGrey,
      )));
}

void _disPlayFailure({required BuildContext context, required String text}) {
  return displayDialog(
      context: context, widget: GlobalDialogDisplay(text: text, isItError:  true));
}

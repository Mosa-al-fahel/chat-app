import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/helper/extenstion.dart';
import 'package:whishing/core/helper/fiels_validation.dart';
import 'package:whishing/core/routing/routs.dart';
import 'package:whishing/core/themes/colors.dart';
import 'package:whishing/core/themes/textstyles.dart';
import 'package:whishing/core/widgets/button/global_button.dart';
import 'package:whishing/core/widgets/field/global_form_field.dart';
import 'package:whishing/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:whishing/features/auth/login/presentation/widgets/login_bloc_listener.dart';
import 'package:whishing/features/auth/signup/presentation/widgets/titles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  void login(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    if (cubit.globalKey.currentState!.validate()) {
      cubit.emitLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: cubit.globalKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacing(8),
                  headTexts('Welcome Back', TextStyles.primaryFont24Bold),
                  verticalSpacing(8),
                  headTexts(
                      'Confirm your information and get back to your friends!',
                      TextStyles.lighgreyFont18Medium),
                  verticalSpacing(42),
                  GlobalFormField(
                      validator: (value) => fieldValidation(value!, 40, 8),
                      hintText: 'email',
                      controller: cubit.email),
                  verticalSpacing(25),
                  GlobalFormField(
                      validator: (value) => fieldValidation(value!, 100, 6),
                      hintText: 'password',
                      controller: cubit.password),
                  verticalSpacing(12),
                  Text(' Forget Password?',
                      style: TextStyles.greyFont15regular),
                  verticalSpacing(70),
                  Center(
                    child: Column(
                      children: [
                        GlobalButton(
                            buttonMethodText: 'Login',
                            onPressed: () => login(context)),
                        verticalSpacing(30),
                        GlobalButton(
                          elevation: 3,
                          buttonMethodText: 'create account',
                          onPressed: () =>
                              context.pushReplacementNamed(AppRoutes.signUp),
                          foreGrounColor: AppColors.primaryColor,
                          backGrounColor:
                              const Color.fromARGB(255, 252, 252, 252),
                        )
                      ],
                    ),
                  ),
                  const LoginBlocListener()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

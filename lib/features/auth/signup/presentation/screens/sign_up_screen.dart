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
import 'package:whishing/features/auth/signup/presentation/cubit/sign_up_cubit.dart';
import 'package:whishing/features/auth/signup/presentation/widgets/sign_up_bloc_listener.dart';
import 'package:whishing/features/auth/signup/presentation/widgets/titles.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  void signUpMethod(BuildContext context) {
    if (context.read<SignUpCubit>().globalKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUp();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: SingleChildScrollView(
            child: Form(
              key: cubit.globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacing(8),
                  headTexts('Create An Account', TextStyles.primaryFont24Bold),
                  verticalSpacing(8),
                  headTexts(
                      'Welcome at chat app, join our community \n find your new friends',
                      TextStyles.lighgreyFont18Medium),
                  verticalSpacing(35),
                  GlobalFormField(
                      validator: (value) => fieldValidation(value!, 50, 3),
                      hintText: 'name',
                      controller: cubit.userName),
                  verticalSpacing(25),
                  GlobalFormField(
                      validator: (value) => fieldValidation(value!, 40, 8),
                      hintText: 'email',
                      controller: cubit.email),
                  verticalSpacing(25),
                  GlobalFormField(
                      validator: (value) => fieldValidation(value!, 100, 8),
                      hintText: 'password',
                      controller: cubit.password),
                  verticalSpacing(25),
                  verticalSpacing(65),
                  Center(
                    child: Column(
                      children: [
                        GlobalButton(
                          buttonMethodText: 'Sign Up',
                          onPressed: () => signUpMethod(context),
                        ),
                        verticalSpacing(30),
                        GlobalButton(
                          elevation: 3,
                          buttonMethodText: 'Log in',
                          onPressed: () =>
                              context.pushReplacementNamed(AppRoutes.login),
                          foreGrounColor: AppColors.primaryColor,
                          backGrounColor:
                              const Color.fromARGB(255, 252, 252, 252),
                        ),
                        const SignUpBlocBuilder()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whishing/core/helper/extenstion.dart';
import 'package:whishing/core/themes/colors.dart';
import 'package:whishing/core/widgets/states/dialog_display.dart';
import 'package:whishing/features/home/presentation/cubit/home_page_cubit.dart';

class AddFriendsBlocListener extends StatelessWidget {
  const AddFriendsBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomePageCubit, HomePageStates>(
      listener: (context, state) {
        if (state.addFreindState == PageStates.loading) {
          _disPlayLoading(context);
        }
        if (state.addFreindState == PageStates.success) {
          context.pop(false);
          _disPlaySuccess(context);
          context.read<HomePageCubit>().resetAddingState();
        }
        if (state.addFreindState == PageStates.failure) {
          context.pop(false);
          _disPlayAddingFailre(context, state.addindContactError!.message!);
          context.read<HomePageCubit>().resetAddingState();
        }
      },
      child: const SizedBox.shrink(),
    );
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

void _disPlaySuccess(BuildContext context) {
  return displayDialog(
      context: context,
      widget: const Center(
          child: GlobalDialogDisplay(
        text: 'Friend Was Added Successfully',
        isItError: false,
      )));
}

void _disPlayAddingFailre(BuildContext context, String text) {
  return displayDialog(
      context: context,
      widget: GlobalDialogDisplay(
        text: text,
        isItError: true,
      ));
}

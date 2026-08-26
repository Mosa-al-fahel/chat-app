import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/themes/colors.dart';
import 'package:whishing/core/themes/textstyles.dart';
import 'package:whishing/features/home/presentation/cubit/home_page_cubit.dart';

class DrawerBlocBuilder extends StatelessWidget {
  const DrawerBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageStates>(
        builder: (context, state) {
      return UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            maxRadius: 40.r,
            backgroundColor: AppColors.lightestGrey,
            child: Icon(
              Icons.person,
              size: 50.r,
              color: AppColors.lightGrey, 
            ),
          ),
          accountName: Text(state.profileData!.username ?? "",
              style: TextStyles.greyFont15regular
                  .copyWith(color: Theme.of(context).colorScheme.onTertiary)),
          accountEmail: Text(state.profileData!.email ?? "",
              style: TextStyles.greyFont15regular
                  .copyWith(color: Theme.of(context).colorScheme.onTertiary)));
    });
  }
}

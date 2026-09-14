import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/data/local/cashed_user_data.dart';
import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/helper/extenstion.dart';
import 'package:whishing/core/routing/routs.dart';
import 'package:whishing/core/themes/colors.dart';
import 'package:whishing/core/themes/textstyles.dart';
import 'package:whishing/features/home/presentation/widgets/drawer/drawer_bloc_builder.dart';
import 'package:whishing/themes_cubit/theme_cubit.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.profileData});
  final UserEntity profileData;
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ThemeCubit>();
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        children: [
          const DrawerBlocBuilder(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: ListView(
                children: [
                  SizedBox(
                    height: 50.h,
                    child: Row(
                      children: [
                        Text(
                          'Dark mood',
                          style: TextStyles.blackFont16Medium.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onTertiaryFixed),
                        ),
                        const Spacer(),
                        Switch(
                            splashRadius:
                                CircularProgressIndicator.strokeAlignOutside,
                            inactiveThumbColor: AppColors.ordinaryGrey,
                            activeThumbColor: AppColors.lighterGrey,
                            inactiveTrackColor: AppColors.lighterGrey,
                            activeTrackColor: AppColors.secondColor,
                            value:
                                Theme.of(context).brightness == Brightness.dark,
                            onChanged: (onChanged) {
                              cubit.changeTheme();
                            })
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.lightGrey,
                    height: 0.2.h,
                  )
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: ListTile(
                leading: const Icon(Icons.logout_rounded, color: Colors.red),
                title: const Text(
                  'Log Out',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () => logOut(context)),
          ),
          // const LogoutBlocListener(),
        ],
      ),
    );
  }
}

void logOut(BuildContext context) async {
  await GetUserCashedData.clearUserData();
  
  context.pushNamedAndRemoveUntil(AppRoutes.login,
      routepredicate: (context) => false);
}

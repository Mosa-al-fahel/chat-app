import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/helper/extenstion.dart';
import 'package:whishing/core/routing/routs.dart';
import 'package:whishing/core/themes/colors.dart';
import 'package:whishing/features/home/presentation/cubit/home_page_cubit.dart';
import 'package:whishing/features/home/presentation/widgets/suggusted_people/suggestion_people_structue.dart';

class SuggustedPeopleList extends StatelessWidget {
  const SuggustedPeopleList({super.key, required this.suggestionsList});
  final List<UserEntity> suggestionsList;

  void addFriend(BuildContext context, String userId) {
    context.read<HomePageCubit>().addFriends(friendId: userId);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 130.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: suggestionsList.length,
              itemBuilder: (context, index) {
                final UserEntity userData = suggestionsList[index];
                if (index < 4) {
                  return SuggustedPersonStructure(
                    leftDistance: 6,
                    topDistance: 65,
                    onTap: () => context
                        .read<HomePageCubit>()
                        .addFriends(friendId: userData.id!),
                    isRequested: false,
                    userData: userData,
                  );
                }
                if (index == 4) {
                  return goToExplorePage(context);
                }
                return const SizedBox.shrink();
              }),
        ));
  }
}

class SuggustedPeopleGrid extends StatelessWidget {
  const SuggustedPeopleGrid({super.key, required this.suggestionsList});
  final List<UserEntity> suggestionsList;

  void addFriend(BuildContext context, String userId) {
    context.read<HomePageCubit>().addFriends(friendId: userId);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            itemCount: suggestionsList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              final userDataG = suggestionsList[index];
              return SuggustedPersonStructure(
                leftDistance: 22,
                topDistance: 85,
                onTap: () => context
                    .read<HomePageCubit>()
                    .addFriends(friendId: userDataG.id!),
                isRequested: false,
                userData: userDataG,
              );
            }));
  }
}

Widget goToExplorePage(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.h),
    child: GestureDetector(
      onTap: () => context.pushNamed(AppRoutes.exploreFriends,
          arguments: context.read<HomePageCubit>().suggustions),
      child: CircleAvatar(
        maxRadius: 35.r,
        backgroundColor: AppColors.lighterGrey,
        child: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.ordinaryGrey,
          size: 30.r,
        ),
      ),
    ),
  );
}

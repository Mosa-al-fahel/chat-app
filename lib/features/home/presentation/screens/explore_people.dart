import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/helper/extenstion.dart';
import 'package:whishing/core/themes/textstyles.dart';
import 'package:whishing/core/widgets/field/global_form_field.dart';
import 'package:whishing/features/home/presentation/cubit/home_page_cubit.dart';
import 'package:whishing/features/home/presentation/widgets/suggusted_people/add_friend/add_friends_bloc_listener.dart';
import 'package:whishing/features/home/presentation/widgets/suggusted_people/suggestion_bloc_builder.dart';

class ExplorePeopleScreen extends StatelessWidget {
  // const ExplorePeopleScreen({super.key, this.suggustedUsers});
  //final List<UserEntity>? suggustedUsers;
  const ExplorePeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomePageCubit>();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: Form(
          key: cubit.fomrkeyExp,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () => context.pop(false),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 30.r,
                        color: Theme.of(context).colorScheme.tertiary,
                      )),
                  Text(
                    'Expand your Community',
                    style: TextStyles.blackFont18Medium.copyWith(
                        color: Theme.of(context).colorScheme.onTertiaryFixed),
                  ),
                ],
              ),
              verticalSpacing(5),
              GlobalFormField(
                  borderRadius: 15.r,
                  highPadding: 1.h,
                  hintText: 'Explore People',
                  controller: cubit.serachForExpController,
                  onChanged: (_) => cubit.filterSuggustions()),
              verticalSpacing(6),
              SuggestionGridBlocBuilder(),
              AddFriendsBlocListener()
            ],
          ),
        ),
      )),
    );
  }
}

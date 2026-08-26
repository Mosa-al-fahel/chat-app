import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/helper/extenstion.dart';
import 'package:whishing/core/routing/routs.dart';
import 'package:whishing/core/themes/colors.dart';
import 'package:whishing/core/themes/textstyles.dart';
import 'package:whishing/core/widgets/button/global_button.dart';
import 'package:whishing/features/home/presentation/cubit/home_page_cubit.dart';
import 'package:whishing/features/home/presentation/widgets/suggusted_people/add_friend/add_friends_bloc_listener.dart';
import 'package:whishing/features/home/presentation/widgets/contacts/contacts_bloc_builder.dart';
import 'package:whishing/features/home/presentation/widgets/drawer/drawer.dart';
import 'package:whishing/features/home/presentation/widgets/head/home_head.dart';
import 'package:whishing/features/home/presentation/widgets/suggusted_people/suggestion_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(profileData: UserEntity()),
      bottomNavigationBar: BottomAppBar(
        elevation: 3,
        child: GlobalButton(
          high: 140.h,
          buttonMethodText: "Friend Requests",
          backGrounColor: AppColors.secondColor,
          onPressed: () => context.pushNamed(AppRoutes.requests),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async =>
              await context.read<HomePageCubit>().initHomePage(),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Form(
                  key: context.read<HomePageCubit>().fomrkey,
                  child: SizedBox(
                    height: 140.h,
                    width: double.maxFinite.w,
                    child: Column(
                      children: [
                        const AddFriendsBlocListener(),
                        verticalSpacing(10),
                        const HomeHead(),
                        verticalSpacing(14),
                        Text('Explore & Add new friends:',
                            textAlign: TextAlign.start,
                            style: TextStyles.blackFont18Medium.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryFixed)),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SuggestionBlocBuilder()),
              const ContactsBlocBuilder()
            ],
          ),
        ),
      ),
    );
  }
}

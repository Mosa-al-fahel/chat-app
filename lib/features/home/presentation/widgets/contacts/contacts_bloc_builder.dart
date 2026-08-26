import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/features/home/presentation/cubit/home_page_cubit.dart';
import 'package:whishing/features/home/presentation/widgets/contacts/contact_list.dart';
import 'package:whishing/features/home/presentation/widgets/contacts/contects_loading_view.dart';
import 'package:whishing/features/home/presentation/widgets/failure_view.dart';

class ContactsBlocBuilder extends StatelessWidget {
  const ContactsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageStates>(
        builder: (context, state) {
      if (state.contactsState == PageStates.loading) {
        return contactLoadingState();
      }
      if (state.contactsState == PageStates.empty) {
        return SliverToBoxAdapter(
          child: notifyDialog(
              'You have not added friends yet, you can add fiends and start conversations',
              'EmptyContactsX',context),
        );
      }
      if (state.contactsState == PageStates.success) {
        return ContactsList(friendsList: state.contactsList);
      }
      if (state.contactsState == PageStates.failure) {
        return SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 20.h),
            child: notifyDialog(
                state.contantsError!.message!, 'FAILED_TO_DISPLAY_FRIENDS',context),
          ),
        );
      }
      if (state.contactsState == PageStates.emptySearch) {
        return SliverToBoxAdapter(child: SizedBox.fromSize());
      }
      return SliverToBoxAdapter(child: SizedBox.fromSize());
    });
  }
}

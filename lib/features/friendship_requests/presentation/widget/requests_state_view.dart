import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/themes/textstyles.dart';
import 'package:whishing/core/widgets/contact_structure.dart';
import 'package:whishing/core/widgets/states/loading_contact_displayed.dart';
import 'package:whishing/features/friendship_requests/presentation/cubit/requests_cubit.dart';

class RequestsList extends StatelessWidget {
  const RequestsList({super.key, required this.requestsList});
  final List<UserEntity> requestsList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: requestsList.length,
        itemBuilder: (context, index) => ContactStructure(
              isFriend: false,
              userData: requestsList[index],
              onPressed: () => context
                  .read<RequestsCubit>()
                  .acceptFriendRequest(senderId: requestsList[index].id!),
            ));
  }
}

Widget loadingRequestsView() {
  return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return const LoadingContactDisplayed();
      });
}

Widget emptyRequestsView(BuildContext context) {
  return Center(
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      height: 300.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.outlineVariant,
          borderRadius: BorderRadius.circular(8.r)),
      child: Text(
        'You have no requests For now',
        style: TextStyles.lighgreyFont18Medium.copyWith(
            color: Theme.of(context).colorScheme.onSecondaryContainer),
      ),
    ),
  );
}

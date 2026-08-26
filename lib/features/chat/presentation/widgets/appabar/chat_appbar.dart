import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/helper/extenstion.dart';
import 'package:whishing/core/themes/colors.dart';
import 'package:whishing/core/themes/textstyles.dart';

PreferredSizeWidget customBar(
    {required String userName,
    required String userPhoto,
    required bool isTyping,
    required BuildContext context}) {
  return AppBar(
    leading: GestureDetector(
      child: Icon(
        Icons.arrow_back_ios,
        size: 24.w,
      ),
      onTap: () => context.pop(false),
    ),
    toolbarHeight: 100.h,
    title: ListTile(
      contentPadding: EdgeInsets.zero,
      leading: _displayUserPicture(userPicture: userPhoto),
      subtitle: Text(isTyping ? 'typing...' : '',
          style: TextStyles.greyFont15regular
              .copyWith(color: Theme.of(context).colorScheme.tertiary)),
      title: Text(userName,
          style: TextStyles.blackFont16Medium.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer)),
    ),
  );
}

Widget _displayUserPicture({String? userPicture}) {
  if (userPicture == "https://placeholder-avatar.png" || userPicture == null) {
    return CircleAvatar(
      maxRadius: 32.r,
      backgroundColor: AppColors.lightestGrey,
      child: Icon(
        Icons.person,
        size: 35.r,
        color: AppColors.strongGrey,
      ),
    );
  }
  return Image.network(
    userPicture,
    fit: BoxFit.fill,
    height: 75.h,
  );
}

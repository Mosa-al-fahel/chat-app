import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/themes/colors.dart';
import 'package:whishing/core/themes/textstyles.dart';

Widget setupEmptyChat() {
  return Center(
    child: Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 20.w),
      height: 150.h,
      width: 300.w,
      decoration: BoxDecoration(
          color: AppColors.lightestGrey,
          borderRadius: BorderRadius.circular(12.r)),
      child:
          Text('start first conversation', style: TextStyles.greyFont15regular),
    ),
  );
}

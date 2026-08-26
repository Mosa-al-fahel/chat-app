import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customizeContainerOnLoading(
    {required int height,
    required int width,
    required int borderradius,
    required BuildContext context}) {
  return Container(
    height: height.h,
    width: width.w,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.secondaryContainer,
      borderRadius: BorderRadius.circular(borderradius.r),
    ),
  );
}

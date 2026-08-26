import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/themes/textstyles.dart';

Widget notifyDialog(String text, String keyValue, BuildContext context) =>
    Container(
        height: 150.h,
        width: 400.w,
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20),
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
              width: 0.5.w, color: Theme.of(context).colorScheme.surface),
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyles.greyFont15regular.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer),
        ));

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/themes/colors.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton(
      {super.key,
      this.onPressed,
      required this.buttonMethodText,
      this.high,
      this.width,
      this.radius,
      this.backGrounColor,
      this.foreGrounColor,
      this.elevation});
  final void Function()? onPressed;
  final String buttonMethodText;
  final double? high;
  final double? width;
  final double? radius;
  final Color? backGrounColor;
  final Color? foreGrounColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? 340.w,
        height: high ?? 74.h,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              elevation: elevation ?? 0,
              foregroundColor: foreGrounColor ?? Colors.white,
              backgroundColor: backGrounColor ?? AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 14.r)),
            ),
            child: Text(
              buttonMethodText,
              textAlign: TextAlign.center,
            )));
  }
}

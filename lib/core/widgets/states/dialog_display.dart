import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/helper/extenstion.dart';
import 'package:whishing/core/themes/colors.dart';
import 'package:whishing/core/widgets/button/global_button.dart';

class GlobalDialogDisplay extends StatelessWidget {
  const GlobalDialogDisplay({
    super.key,
    required this.text,
    required this.isItError,
  });
  final String text;
  final bool isItError;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationDuration: Durations.extralong4,
      insetAnimationCurve: Curves.bounceOut,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: SizedBox(
          height: 220.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(isItError ? Icons.info_outline : Icons.check_circle_outline,
                  size: 45.r, color: AppColors.ordinaryGrey),
              SizedBox(height: 15.h),
              SizedBox(
                height: 60,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp, color: Colors.black87),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: GlobalButton(
                  radius: 10.r,
                  high: 40.h,
                  width: 95.w,
                  buttonMethodText: 'Ok',
                  onPressed: () => context.pop((false)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void displayDialog({BuildContext? context, Widget? widget, bool? dismissible}) {
  showDialog(
      context: context!,
      barrierDismissible:
          dismissible ?? false, // لمنع إغلاق الدايلوج بالضغط في الخارج
      builder: (context) => widget!);
}

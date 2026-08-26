import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingContactDisplayed extends StatelessWidget {
  const LoadingContactDisplayed({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 4.h),
        elevation: 1,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.5.r))),
        child: ListTile(
          leading: SizedBox(
              width: 50.w,
              child: CircleAvatar(
                maxRadius: 40.r,
                backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              )),
          title: Container(
            margin: EdgeInsets.only(top: 12.h, right: 6.w, left: 6.w),
            height: 22.h,
            width: 70.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
          ),
          subtitle: Container(
            margin: EdgeInsets.only(top: 14.h, right: 13.w, left: 10.w),
            height: 18.h,
            width: 40.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.r),
              color: Theme.of(context).colorScheme.secondaryContainer,
            ),
          ),
          trailing: Container(
              height: 20.h,
              width: 45.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: Theme.of(context).colorScheme.secondaryContainer,
              )),
        ),
      ),
    );
  }
}

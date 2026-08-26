import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/widgets/states/loading_contact_displayed.dart';

SliverToBoxAdapter contactLoadingState() {
  return SliverToBoxAdapter(
    child: SizedBox(
        height: 600.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 8.h),
          child: ListView(
            children: [
              ...List.generate(4, (index) => const LoadingContactDisplayed())
            ],
          ),
        )),
  );
}

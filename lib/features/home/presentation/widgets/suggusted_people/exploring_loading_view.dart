import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/widgets/custome_container_loading.dart';

Widget exploredPeopleloadingView(BuildContext context) {
  return SizedBox(
    height: 130.h,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [...List.generate(5, (index) => _loadingShow(context))],
    ),
  );
}

Widget exploredPeopleloadingGridView() {
  return SizedBox(
      width: double.infinity.w,
      height: 500.h,
      child: GridView.builder(
          itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return _loadingShow(context);
          }));
}

Widget _loadingShow(BuildContext context) => SizedBox(
      height: 100.h,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            customizeContainerOnLoading(
                borderradius: 200, height: 100, width: 80, context: context),
            SizedBox(height: 6.h),
            customizeContainerOnLoading(
                borderradius: 100, height: 20, width: 55, context: context),
          ])),
    );


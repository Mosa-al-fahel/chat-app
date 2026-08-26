import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/themes/colors.dart';
import 'package:whishing/core/themes/textstyles.dart';

class SuggustedPersonStructure extends StatelessWidget {
  const SuggustedPersonStructure(
      {super.key,
      required this.userData,
      required this.isRequested,
      this.onTap,
      required this.topDistance,
      required this.leftDistance});
  final UserEntity userData;
  final bool isRequested;
  final void Function()? onTap;
  final double topDistance;
  final double leftDistance;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        SizedBox(
            width: 95.w,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                maxRadius: 50.r,
                child: Icon(Icons.person,
                    color: Theme.of(context).colorScheme.onSurface),
              ),
              Text(
                userData.username!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyles.strongGreyFont14Meduem
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            ])),
        Positioned(
          left: leftDistance.w,
          top: topDistance.h,
          child: GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              backgroundColor: AppColors.secondColor,
              maxRadius: 15.r,
              child: Icon(
                size: 30.r,
                isRequested ? Icons.timer_sharp : Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

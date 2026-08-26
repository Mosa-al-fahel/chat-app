import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/domain/user_entity.dart';
import 'package:whishing/core/helper/format_date.dart';
import 'package:whishing/core/themes/textstyles.dart';
import 'package:whishing/core/widgets/button/global_button.dart';

class ContactStructure extends StatelessWidget {
  const ContactStructure(
      {super.key,
      this.userData,
      required this.isFriend,
      this.onPressed,
      this.contactFunction});
  final UserEntity? userData;
  final bool isFriend;
  final void Function()? onPressed;
  final void Function()? contactFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: contactFunction,
      child: SizedBox(
        height: 130.h,
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 8.h),
          elevation: 2,
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.5.r))),
          child: ListTile(
            leading: SizedBox(
              width: 50.w,
              child: ClipRRect(
                child: Icon(
                  Icons.person_sharp,
                  size: 45.r,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            title: Text(
              userData!.username ?? "userName",
            ),
            subtitle: isFriend
                ? Text(
                    userData!.lastMessage!,
                    style: TextStyles.greyFont15regular,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
                : GlobalButton(
                    radius: 7.r,
                    buttonMethodText: 'Accept',
                    high: 35.h,
                    onPressed: onPressed),
            trailing: isFriend
                ? Text(
                    formatTime(userData?.lastMessageTime),
                    style:
                        TextStyles.greyFont15regular.copyWith(fontSize: 12.sp),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

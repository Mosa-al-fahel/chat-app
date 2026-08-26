import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/themes/colors.dart';
import 'package:whishing/core/themes/textstyles.dart';

class MessageStructure extends StatelessWidget {
  const MessageStructure(
      {super.key, required this.isMe, required this.message});
  final bool isMe;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15),
            topRight: const Radius.circular(15),
            bottomLeft: Radius.circular(isMe ? 15 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 15),
          ),
          color: isMe ? AppColors.messageColor : AppColors.lighterGrey,
        ),
        // FIX: Removed the incorrect 'Expanded' widget wrapper
        child: Text(message,
            style: isMe
                ? TextStyles.messageStyle
                : TextStyles.messageStyle.copyWith(color: Colors.black)),
      ),
    );
  }
}

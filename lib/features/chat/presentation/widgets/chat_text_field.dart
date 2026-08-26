import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/helper/extenstion.dart';
import 'package:whishing/core/themes/colors.dart';
import 'package:whishing/core/themes/textstyles.dart';
import 'package:whishing/core/widgets/field/global_form_field.dart';

class ChatTextField extends StatelessWidget {
    const ChatTextField({super.key, this.onTap, required this.controller,this.onChanged});
  final void Function()? onTap;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.5.h),
      child: Row(
        children: [
          Expanded(
            child: GlobalFormField(
              borderRadius: 28.r,
              highPadding: 8.h,
              hintText: 'Type a message',
              hintSyle: TextStyles.greyFont15regular ,
              controller: controller,
              onChanged: onChanged,
            ),
          ),
          horizontalSpacing(15),
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              maxRadius: 28.r,
              backgroundColor: AppColors.primaryColor,
              child: const Icon(Icons.send_rounded, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

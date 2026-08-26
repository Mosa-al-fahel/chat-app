import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/themes/colors.dart';

class TextStyles {
  static TextStyle primaryFont24Bold = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.primaryColor);
  static TextStyle lighgreyFont18Medium = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColors.lightGrey);
  static TextStyle greyFont15regular = TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeights.regularFont,
      color: AppColors.ordinaryGrey);

  static TextStyle strongGreyFont14Meduem = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeights.lightMediumFont,
      color: AppColors.strongGrey);
      static TextStyle strongGreyFont16Meduem = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeights.lightMediumFont,
      color: AppColors.strongGrey);
  //then medium
  static TextStyle blackFont18Medium = TextStyle(
      fontSize: 18.sp, fontWeight: FontWeights.mediumFont);
  static TextStyle blackFont16Medium = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeights.mediumFont,
      color: Colors.black,
      height: 1.1.h);
       static TextStyle  messageStyle =
        TextStyle(
     fontSize: 16.sp, color: Colors.white
       );
       
       


      
     
}

class FontWeights {
  static const FontWeight boldFont = FontWeight.w800;
  static const FontWeight lightMediumFont = FontWeight.w500;
  static const FontWeight mediumFont = FontWeight.w600;
  static const FontWeight regularFont = FontWeight.w400;
  static const FontWeight thenFont = FontWeight.w300;
}

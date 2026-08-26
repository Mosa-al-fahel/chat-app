import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whishing/core/themes/colors.dart';
import 'package:whishing/core/themes/textstyles.dart';

class GlobalFormField extends StatelessWidget {
  const GlobalFormField(
      {super.key,
      this.onChanged,
      this.widthPadding,
      this.highPadding,
      this.suffix,
      required this.hintText,
      this.borderRadius,
      required this.controller,
      this.secured,
      this.validator,
      this.hintSyle});
  final double? widthPadding;
  final double? highPadding;
  final IconData? suffix;
  final String hintText;
  final double? borderRadius;
  final TextEditingController controller;
  final bool? secured;
  final String? Function(String?)? validator;
  final TextStyle? hintSyle;
  final void Function(String)? onChanged;

  OutlineInputBorder _customizeBorder({double? radius, required Color color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 13.r),
        borderSide: BorderSide(width: 1.w, color: color));
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      validator: validator,
      obscureText: secured ?? false,
      controller: controller,
      decoration: InputDecoration(
          hintStyle: hintSyle ??
              TextStyles.strongGreyFont16Meduem
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surface,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(
              horizontal: widthPadding ?? 14.w, vertical: highPadding ?? 18.h),
          suffix: Icon(suffix, color: AppColors.ordinaryGrey),
          enabledBorder: _customizeBorder(
              color: Theme.of(context).colorScheme.outlineVariant,
              radius: borderRadius),
          focusedBorder: _customizeBorder(
              color: Theme.of(context).colorScheme.outlineVariant,
              radius: borderRadius),
          errorBorder:
              _customizeBorder(color: Colors.red, radius: borderRadius)),
    );
  }
}

// class GlobalFormField extends StatelessWidget {
//   const GlobalFormField(
//       {super.key,
//       required this.hintText,
//       this.suffix,
//       this.controller,
//       this.secured,
//       this.validationMethod,
//       this.radius,
//       this.highPaffing,
//       this.widthPadding});
//   final TextEditingController? controller;
//   final bool? secured;
//   final String? Function(String?)? validationMethod;
//   final String hintText;
//   final IconData? suffix;
//   final double? radius;
//   final double? highPaffing;
//   final double? widthPadding;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       obscureText: secured ?? false,
//       controller: controller,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
//         contentPadding: EdgeInsets.symmetric(
//             horizontal: widthPadding ?? 18.w, vertical: highPaffing ?? 20.h),
//         suffix: Icon(suffix, color: AppColors.ordinaryGrey),
//         filled: true,
//         fillColor: AppColors.lightestGrey,
//         hintText: hintText,
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(radius ?? 13.r),
//             borderSide: BorderSide(
//               width: 0.8.w,
//               color: AppColors.lighterGrey,
//             )),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(13.r),
//             borderSide: BorderSide(width: 1.w, color: AppColors.lightGrey)),
//         errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(13.r),
//             borderSide: BorderSide(width: 1.w, color: Colors.red)),
//       ),
//     );
//   }
// }

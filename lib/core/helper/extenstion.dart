import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routename, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routename, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routename, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routename, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routename,
      {Object? arguments, required RoutePredicate routepredicate}) {
    return Navigator.of(this).pushNamedAndRemoveUntil(routename, routepredicate,
        arguments: arguments);
  }

  void pop(bool routnavigator) =>
      Navigator.of(this, rootNavigator: routnavigator).pop();
}

extension GetSpacing on Widget {
  SizedBox verticalSpacing(double height) {
    return SizedBox(
      height: height.h,
    );
  }

  SizedBox horizontalSpacing(double width) {
    return SizedBox(
      width: width.h,
    );
  }
}

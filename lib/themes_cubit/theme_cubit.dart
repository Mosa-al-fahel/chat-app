import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:whishing/core/constants/strings.dart';
import 'package:whishing/core/helper/shared_prefrences.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(bool isDark)
      : super(isDark ? ThemeMode.dark : ThemeMode.light);

  void changeTheme() async {
    final isItDark = state == ThemeMode.dark;
    final newThemeMode = !isItDark;
    await SharedPreference.setData(StringsConstants.themeDark, newThemeMode);
    emit(newThemeMode ? ThemeMode.dark : ThemeMode.light);
  }
}

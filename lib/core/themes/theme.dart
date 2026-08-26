import 'package:flutter/material.dart';
import 'package:whishing/core/themes/colors.dart';
import 'package:whishing/core/themes/textstyles.dart';

ThemeData darkTheme = ThemeData(
  cardTheme: CardThemeData(color: AppColors.strongGrey),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor, foregroundColor: Colors.white),
  ),
  primaryColor: AppColors.primaryColor,
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
  ).copyWith(
    tertiary: AppColors.lightestGrey,
    onTertiary: AppColors.lightestGrey,
    primary: AppColors.primaryColor,
    outlineVariant: AppColors.strongGrey,
    surface: AppColors.ordinaryGrey,
    onSurface: AppColors.lightestGrey,
    secondaryContainer: AppColors.ordinaryGrey,
    onSecondaryContainer: AppColors.lightestGrey,
    onTertiaryFixed: AppColors.lightestGrey,
  ),
  drawerTheme: DrawerThemeData(backgroundColor: AppColors.darkThemeBackground),
  scaffoldBackgroundColor: AppColors.darkThemeBackground,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 36, 36, 36),
  ),
  listTileTheme:
      ListTileThemeData(titleTextStyle: TextStyles.blackFont16Medium),
);
ThemeData lightTheme = ThemeData(
  drawerTheme: DrawerThemeData(backgroundColor: Colors.white),
  cardTheme: CardThemeData(color: AppColors.lightestGrey),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor, foregroundColor: Colors.white),
  ),
  primaryColor: AppColors.primaryColor,
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
  ).copyWith(
      //for icons
      tertiary: Colors.grey,
      onTertiaryFixed: Colors.black,
      //for text colors
      onTertiary: AppColors.lightestGrey,
      primary: AppColors.primaryColor,
      outlineVariant: AppColors.lighterGrey,
      surface: AppColors.lightestGrey,
      onSurface: AppColors.ordinaryGrey,
      secondaryContainer: AppColors.lighterGrey,
      onSecondaryContainer: AppColors.ordinaryGrey),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.primaryColor),
  listTileTheme:
      ListTileThemeData(titleTextStyle: TextStyles.strongGreyFont16Meduem),
);

// loading pieces contain:
//exploring + pieces on contacts; surface === ordinarygrey
//background of loading contacts is the same of success = stringgrey

//success:

//contacts: carf theme
//suggustions:
// circle surface
//font on surface

// font for title: in the head of ome : surface
//suggustions: surface
// failure:
// background: secondarycontainer   font: onsecondarycontainer

// card if

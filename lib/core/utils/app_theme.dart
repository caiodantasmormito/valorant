import 'package:flutter/material.dart';
import 'package:valorant/core/utils/colors.dart';
import 'package:valorant/core/utils/font_family.dart';

final ThemeData themeData = ThemeData(
  fontFamily: FontFamily.rubik,
  brightness: Brightness.light,
  primarySwatch: MaterialColor(AppColors.red[900]!.value, AppColors.red),
  primaryColor: AppColors.red[900],
);

final ThemeData themeDataDark = ThemeData(
  fontFamily: FontFamily.rubik,
  brightness: Brightness.dark,
  primaryColor: AppColors.selectedTabColor,
);

import 'package:flutter/material.dart';
import 'package:shoply/utils/color_manager.dart';

class ThemesApp {
  static final light = ThemeData(
    primaryColor: ColorManager.mainColor,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
    ),
  );

  static final dark = ThemeData(
    primaryColor: ColorManager.darkGreyColor,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      backgroundColor: ColorManager.darkGreyColor,
    ),
  );
}

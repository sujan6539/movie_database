import 'package:flutter/material.dart';

AppColors $appColors = AppColors();

class AppColors {
  //0xFF1
  final Color primaryColor = const Color(0xFF7E2AEC);
  final Color primaryColorLight = const Color(0xFF432E61);
  final Color white = const Color(0xFFE7E7FF);
  final Color backgroundColor = const Color(0xFF1B1B1B);

  ThemeData toThemeData(BuildContext context) {
    var theme = ThemeData(fontFamily: "Raleway", brightness: Brightness.dark)
        .copyWith(
            primaryColor: primaryColor,
            backgroundColor: backgroundColor,
            primaryColorLight: primaryColorLight,
            typography: Typography());
    return theme;
  }
}

import 'package:currnverter/src/themes/custom_themes/appbar_theme.dart';
import 'package:currnverter/src/themes/custom_themes/elevated_button_theme.dart';
import 'package:currnverter/src/themes/custom_themes/icon_button_theme.dart';
import 'package:currnverter/src/themes/custom_themes/icon_theme.dart';
import 'package:currnverter/src/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.green[900],
      scaffoldBackgroundColor: Colors.white,
      textTheme: AppTextTheme.lightTextTheme,
      elevatedButtonTheme: ElevatedButtonThemes.lightElevatedButtonTheme,
      appBarTheme: AppbarTheme.lightAppBarTheme,
      iconButtonTheme: IconButtonThemes.lightModeIconButton,
     );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.green[900],
      scaffoldBackgroundColor: Colors.black,
      textTheme: AppTextTheme.darkTextTheme,
      elevatedButtonTheme: ElevatedButtonThemes.darkElevatedButtonTheme,
      appBarTheme: AppbarTheme.darkAppBarTheme);
}

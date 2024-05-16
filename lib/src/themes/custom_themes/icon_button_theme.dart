import 'package:currnverter/src/constants/colors.dart';
import 'package:flutter/material.dart';

class IconButtonThemes {
  IconButtonThemes._();

  static final lightModeIconButton = IconButtonThemeData(
      style: IconButton.styleFrom(
    elevation: 2,
    backgroundColor: AppColors.primaryColors,
    padding: EdgeInsets.all(1),
    iconSize: 1,
  ));
}

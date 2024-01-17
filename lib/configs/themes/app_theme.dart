import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: AppColors.primaryColor,
    ),
    fontFamily: AppFonts.montserrat,
    iconTheme: const IconThemeData(
      color: AppColors.primaryColor,
    ),
  );
}

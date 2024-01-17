import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/configs/themes/app_colors.dart';
import 'package:weather_app/configs/themes/app_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  // white color
  static final TextStyle f14WhiteW400 = TextStyle(
    fontSize: 14.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w400,
    fontFamily: AppFonts.montserrat,
  );
  static final TextStyle f14WhiteW700 = TextStyle(
    fontSize: 14.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w700,
    fontFamily: AppFonts.montserrat,
  );
  static final TextStyle f20WhiteW700 = TextStyle(
    fontSize: 20.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w700,
    fontFamily: AppFonts.montserrat,
  );
  static final TextStyle f40WhiteW700 = TextStyle(
    fontSize: 40.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w700,
    fontFamily: AppFonts.montserrat,
  );

  // black color
  static final TextStyle f44BlackW300 = TextStyle(
    fontSize: 44.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w300,
    fontFamily: AppFonts.montserrat,
  );
}

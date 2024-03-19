library text_style;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestapo/resources/resources.dart';

part 'font_family.dart';

abstract class AppTextStyle {
  //LIGHT THEME SETTINGS
  static final displayMediumLight = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 45.sp,
    color: AppColors.kWhite,
  );
  static final titleLargeLight = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22.sp,
    color: AppColors.kWhite,
  );
  static final titleMediumLight = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: AppColors.kWhite,
  );
  static final titleSmallLight = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    color: AppColors.kWhite,
  );
  static final bodyMediumLight = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppColors.kWhite,
  );
  static final bodySmallLight = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: AppColors.kWhite,
  );
  static final labelMediumLight = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    color: AppColors.kWhite,
  );
  static final labelSmallLight = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11.sp,
    color: AppColors.kWhite,
  );
  //DARK THEME SETTINGS
  static final displayMediumDark = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 45.sp,
    color: AppColors.kBlack,
  );
  static final titleLargeDark = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22.sp,
    color: AppColors.kBlack,
  );
  static final titleMediumDark = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: AppColors.kBlack,
  );
  static final titleSmallDark = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    color: AppColors.kBlack,
  );
  static final bodyMediumDark = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: AppColors.kBlack,
  );
  static final bodySmallDark = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: AppColors.kBlack,
  );
  static final labelMediumDark = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
    color: AppColors.kBlack,
  );
  static final labelSmallDark = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11.sp,
    color: AppColors.kBlack,
  );
}

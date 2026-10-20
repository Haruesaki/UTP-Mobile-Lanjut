import 'package:flutter/material.dart';
import 'package:utp_mobile_spotify/core/theme/app_fonts.dart';
import 'app_colors.dart';

abstract final class AppTextStyles {
  static const TextStyle display24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.33,
    letterSpacing: -0.3,
    color: AppColors.textPrimary,
  );
  static const TextStyle title20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.3,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );
  static const TextStyle stationName22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    height: 1.2,
    letterSpacing: -0.2,
    color: AppColors.stationText,
  );
  static const TextStyle body16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.25,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );
  static const TextStyle bodyBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.35,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );
  static const TextStyle bodyBold14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 1.3,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );
  static const TextStyle caption13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.3,
    letterSpacing: 0,
    color: AppColors.textSecondary,
  );
  static const TextStyle chip13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );
  static const TextStyle button13 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    height: 1.3,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );
  static const TextStyle nav11 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 14/11,
    letterSpacing: 0,
    color: AppColors.textSecondary,
  );
  static const TextStyle nav11Active = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 14/11,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );
  static const TextStyle radio10 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w800,
    height: 1.2,
    letterSpacing: 0.8,
    color: AppColors.stationText,
  );
}
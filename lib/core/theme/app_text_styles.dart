import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle displayLarge = GoogleFonts.inter(
    fontSize: 96,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.16,
  );

  static TextStyle displayMedium = GoogleFonts.inter(
    fontSize: 76,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.21,
  );

  static TextStyle displaySmall = GoogleFonts.inter(
    fontSize: 60,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static TextStyle headlineLarge = GoogleFonts.inter(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.16,
  );

  static TextStyle headlineMedium = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.0,
  );

  static TextStyle headlineSmall = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static TextStyle titleLarge = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.33,
  );

  static TextStyle titleMedium = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.11,
  );

  static TextStyle titleSmall = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.25,
  );

  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.71,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.33,
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  static TextStyle labelLarge = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.43,
  );

  static TextStyle labelMedium = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.33,
  );

  static TextStyle labelSmall = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textTertiary,
    height: 1.4,
  );

  static TextStyle tagLarge = GoogleFonts.inter(
    fontSize: 8,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 1.25,
  );

  static TextStyle tagMedium = GoogleFonts.inter(
    fontSize: 8,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.25,
  );

  static TextStyle tagSmall = GoogleFonts.inter(
    fontSize: 8,
    fontWeight: FontWeight.w400,
    color: AppColors.textTertiary,
    height: 1.25,
  );

  static TextStyle get title => titleLarge;
  static TextStyle get subtitle => titleSmall;
  static TextStyle get body => bodyLarge;
  static TextStyle get caption => bodyMedium;
  static TextStyle get label => labelMedium;

  static TextStyle button = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 1.25,
  );
}

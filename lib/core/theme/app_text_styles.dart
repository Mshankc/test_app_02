import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Display styles
  static TextStyle displayLarge = GoogleFonts.inter(
    fontSize: 96,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 112 / 96, // 1.167
  );

  static TextStyle displayMedium = GoogleFonts.inter(
    fontSize: 76,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 92 / 76, // 1.21
  );

  static TextStyle displaySmall = GoogleFonts.inter(
    fontSize: 60,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 72 / 60, // 1.2
  );

  // Headline styles
  static TextStyle headlineLarge = GoogleFonts.inter(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 56 / 48, // 1.167
  );

  static TextStyle headlineMedium = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 32 / 32, // 1.0
  );

  static TextStyle headlineSmall = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 24 / 20, // 1.2
  );

  // Title styles
  static TextStyle titleLarge = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 24 / 18, // 1.33
  );

  static TextStyle titleMedium = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 20 / 18, // 1.11
  );

  static TextStyle titleSmall = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 20 / 16, // 1.25
  );

  // Body styles
  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 24 / 14, // 1.71
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 16 / 12, // 1.33
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 14 / 10, // 1.4
  );

  // Label styles
  static TextStyle labelLarge = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 20 / 14, // 1.43
  );

  static TextStyle labelMedium = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 16 / 12, // 1.33
  );

  static TextStyle labelSmall = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textTertiary,
    height: 14 / 10, // 1.4
  );

  // Tag styles
  static TextStyle tagLarge = GoogleFonts.inter(
    fontSize: 8,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    height: 10 / 8, // 1.25
  );

  static TextStyle tagMedium = GoogleFonts.inter(
    fontSize: 8,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 10 / 8, // 1.25
  );

  static TextStyle tagSmall = GoogleFonts.inter(
    fontSize: 8,
    fontWeight: FontWeight.w400,
    color: AppColors.textTertiary,
    height: 10 / 8, // 1.25
  );

  // Legacy aliases (for backward compatibility)
  static TextStyle get title => titleLarge;
  static TextStyle get subtitle => titleSmall;
  static TextStyle get body => bodyLarge;
  static TextStyle get caption => bodyMedium;
  static TextStyle get label => labelMedium;

  static TextStyle button = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 20 / 16, // 1.25
  );
}

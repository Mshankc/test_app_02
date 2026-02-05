import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static const TextStyle displayLarge = TextStyle(
    fontSize: 96,
    height: 112 / 96,
  );
  static const TextStyle displayMedium = TextStyle(
    fontSize: 76,
    height: 92 / 76,
  );
  static const TextStyle displaySmall = TextStyle(
    fontSize: 60,
    height: 72 / 60,
  );
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 48,
    height: 56 / 48,
  );
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 32,
    height: 32 / 32,
  );
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 20,
    height: 24 / 20,
  );
  static const TextStyle titleLarge = TextStyle(
    fontSize: 18,
    height: 24 / 18,
  );
  static const TextStyle titleMedium = TextStyle(
    fontSize: 18,
    height: 20 / 18,
  );
  static const TextStyle titleSmall = TextStyle(
    fontSize: 16,
    height: 20 / 16,
  );
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 14,
    height: 24 / 14,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 12,
    height: 16 / 12,
  );
  static const TextStyle bodySmall = TextStyle(
    fontSize: 10,
    height: 14 / 10,
  );
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    height: 20 / 14,
  );
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    height: 16 / 12,
  );
  static const TextStyle labelSmall = TextStyle(
    fontSize: 10,
    height: 14 / 10,
  );
  static const TextStyle tagLarge = TextStyle(
    fontSize: 8,
    height: 10 / 8,
  );
  static const TextStyle tagMedium = TextStyle(
    fontSize: 8,
    height: 10 / 8,
  );
  static const TextStyle tagSmall = TextStyle(
    fontSize: 8,
    height: 10 / 8,
  );
}

class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.surface600,
        colorScheme: ColorScheme.light(
          primary: AppColors.green500,
          surface: AppColors.surface500,
          onSurface: AppColors.text500,
          onPrimary: Colors.white,
        ),
        textTheme: const TextTheme(
          displayLarge: AppTextStyles.displayLarge,
          displayMedium: AppTextStyles.displayMedium,
          displaySmall: AppTextStyles.displaySmall,
          headlineLarge: AppTextStyles.headlineLarge,
          headlineMedium: AppTextStyles.headlineMedium,
          headlineSmall: AppTextStyles.headlineSmall,
          titleLarge: AppTextStyles.titleLarge,
          titleMedium: AppTextStyles.titleMedium,
          titleSmall: AppTextStyles.titleSmall,
          bodyLarge: AppTextStyles.bodyLarge,
          bodyMedium: AppTextStyles.bodyMedium,
          bodySmall: AppTextStyles.bodySmall,
          labelLarge: AppTextStyles.labelLarge,
          labelMedium: AppTextStyles.labelMedium,
          labelSmall: AppTextStyles.labelSmall,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.surface600,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.text500),
          titleTextStyle: TextStyle(
            color: AppColors.text500,
            fontSize: 18,
            height: 24 / 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.borderBlack600),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.borderBlack600),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.green500, width: 1.5),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          hintStyle: const TextStyle(
            color: AppColors.text200,
            fontSize: 14,
            height: 24 / 14,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.green500,
            foregroundColor: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 20 / 16,
            ),
          ),
        ),
      );
}

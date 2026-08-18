import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData get light {
    final scheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.terracotta,
          brightness: Brightness.light,
          surface: AppColors.cream,
        ).copyWith(
          primary: AppColors.terracotta,
          secondary: AppColors.olive,
          surface: AppColors.cream,
          onSurface: AppColors.ink,
          outline: AppColors.border,
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.cream,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: AppColors.olive,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.8,
        ),
        headlineMedium: TextStyle(
          color: AppColors.olive,
          fontWeight: FontWeight.w800,
        ),
        titleLarge: TextStyle(
          color: AppColors.ink,
          fontWeight: FontWeight.w800,
        ),
        titleMedium: TextStyle(
          color: AppColors.ink,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: TextStyle(color: AppColors.ink, height: 1.45),
        bodyMedium: TextStyle(color: AppColors.mutedInk, height: 1.45),
      ),
      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: AppColors.border),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.terracotta,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
        ),
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Color(0xFFFFFCF7),
        indicatorColor: Color(0xFFF8DED3),
      ),
    );
  }
}

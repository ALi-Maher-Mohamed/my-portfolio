import 'package:flutter/material.dart';

class AppTheme {
  // ========== الألوان المستخرجة من المشروع ==========

  // الألوان الأساسية المستخدمة في المشروع
  static const Color primaryCyan = Color(0xFF00FFFF); // Colors.cyanAccent
  static const Color primaryBlue = Color(0xFF448AFF); // Colors.blueAccent
  static const Color secondaryCyan = Color(0xFF00BCD4); // Colors.cyan

  // ألوان الخلفية والنصوص من المشروع
  static const Color darkBackground = Color(0xFF121212);
  static const Color primaryWhite = Color(0xFFFFFFFF);
  static const Color secondaryWhite = Color(0xB3FFFFFF); // Colors.white70
  static const Color primaryBlack = Color(0xFF000000);

  // ========== ثيم الوضع الداكن (باستخدام ألوان المشروع) ==========

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // نظام الألوان الأساسي
      colorScheme: ColorScheme.dark(
        primary: primaryCyan,
        primaryContainer: primaryCyan.withOpacity(0.2),
        secondary: primaryBlue,
        secondaryContainer: primaryBlue.withOpacity(0.2),
        tertiary: secondaryCyan,
        tertiaryContainer: secondaryCyan.withOpacity(0.2),
        surface: const Color(0xFF1E1E1E),
        surfaceContainerHighest: const Color(0xFF2D2D2D),
        surfaceContainerHigh: const Color(0xFF252525),
        surfaceContainer: const Color(0xFF1A1A1A),
        onPrimary: primaryBlack,
        onSecondary: primaryWhite,
        onSurface: primaryWhite,
        onSurfaceVariant: secondaryWhite,
        outline: primaryCyan.withOpacity(0.3),
        outlineVariant: primaryCyan.withOpacity(0.1),
        shadow: primaryBlack.withOpacity(0.5),
        scrim: primaryBlack.withOpacity(0.8),
      ),

      // خلفية التطبيق
      scaffoldBackgroundColor: darkBackground,

      // ثيم النصوص
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: primaryWhite,
          letterSpacing: 3,
          shadows: [
            Shadow(
              blurRadius: 10,
              color: primaryCyan.withOpacity(0.5),
              offset: const Offset(0, 0),
            ),
          ],
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: primaryWhite,
          letterSpacing: 2,
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: primaryCyan,
          shadows: [
            Shadow(
              blurRadius: 5,
              color: primaryCyan.withOpacity(0.3),
              offset: const Offset(0, 0),
            ),
          ],
        ),
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: primaryCyan,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: primaryWhite,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: secondaryWhite,
          height: 1.6,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: secondaryWhite,
          height: 1.5,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: primaryWhite,
        ),
      ),

      // ثيم الأزرار
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryCyan,
          foregroundColor: primaryBlack,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 8,
          shadowColor: primaryCyan.withOpacity(0.5),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryCyan,
          side: BorderSide(color: primaryCyan, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),

      // ثيم الحاويات والكروت
      cardTheme: CardTheme(
        color: const Color(0xFF1E1E1E),
        elevation: 8,
        shadowColor: primaryCyan.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: primaryCyan.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),

      // ثيم الأيقونات
      iconTheme: IconThemeData(
        color: primaryCyan,
        size: 24,
      ),

      // ثيم شريط التطبيق
      appBarTheme: AppBarTheme(
        backgroundColor: darkBackground,
        foregroundColor: primaryWhite,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: primaryWhite,
        ),
        iconTheme: IconThemeData(color: primaryCyan),
      ),

      // ثيم الحقول
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryCyan.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryCyan.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryCyan, width: 2),
        ),
        labelStyle: TextStyle(color: secondaryWhite),
        hintStyle: TextStyle(color: secondaryWhite.withOpacity(0.6)),
      ),
    );
  }

  // ========== ثيم الوضع الفاتح (مقترح متناسق) ==========

  // ألوان مقترحة للوضع الفاتح
  static const Color lightPrimary = Color(0xFF0097A7); // تركوازي داكن
  static const Color lightSecondary = Color(0xFF1976D2); // أزرق كلاسيكي
  static const Color lightTertiary = Color(0xFF00ACC1); // سماوي
  static const Color lightBackground = Color(0xFFFAFAFA); // رمادي فاتح جداً
  static const Color lightSurface = Color(0xFFFFFFFF); // أبيض
  static const Color lightOnPrimary = Color(0xFFFFFFFF); // أبيض
  static const Color lightOnSurface = Color(0xFF212121); // رمادي داكن
  static const Color lightOnSurfaceVariant = Color(0xFF757575); // رمادي متوسط

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // نظام الألوان للوضع الفاتح
      colorScheme: ColorScheme.light(
        primary: lightPrimary,
        primaryContainer: lightPrimary.withOpacity(0.1),
        secondary: lightSecondary,
        secondaryContainer: lightSecondary.withOpacity(0.1),
        tertiary: lightTertiary,
        tertiaryContainer: lightTertiary.withOpacity(0.1),
        surface: lightSurface,
        surfaceContainerHighest: const Color(0xFFF5F5F5),
        surfaceContainerHigh: const Color(0xFFF8F8F8),
        surfaceContainer: const Color(0xFFFCFCFC),
        onPrimary: lightOnPrimary,
        onSecondary: lightOnPrimary,
        onSurface: lightOnSurface,
        onSurfaceVariant: lightOnSurfaceVariant,
        outline: lightPrimary.withOpacity(0.4),
        outlineVariant: lightPrimary.withOpacity(0.2),
        shadow: const Color(0xFF000000).withOpacity(0.2),
        scrim: const Color(0xFF000000).withOpacity(0.5),
      ),

      // خلفية التطبيق
      scaffoldBackgroundColor: lightBackground,

      // ثيم النصوص للوضع الفاتح
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: lightOnSurface,
          letterSpacing: 3,
          shadows: [
            Shadow(
              blurRadius: 10,
              color: lightPrimary.withOpacity(0.3),
              offset: const Offset(0, 2),
            ),
          ],
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: lightOnSurface,
          letterSpacing: 2,
        ),
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: lightPrimary,
          shadows: [
            Shadow(
              blurRadius: 3,
              color: lightPrimary.withOpacity(0.2),
              offset: const Offset(0, 1),
            ),
          ],
        ),
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: lightPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: lightOnSurface,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: lightOnSurfaceVariant,
          height: 1.6,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: lightOnSurfaceVariant,
          height: 1.5,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: lightOnSurface,
        ),
      ),

      // ثيم الأزرار للوضع الفاتح
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: lightPrimary,
          foregroundColor: lightOnPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 6,
          shadowColor: lightPrimary.withOpacity(0.3),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: lightPrimary,
          side: BorderSide(color: lightPrimary, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),

      // ثيم الحاويات والكروت للوضع الفاتح
      cardTheme: CardTheme(
        color: lightSurface,
        elevation: 4,
        shadowColor: lightPrimary.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: lightPrimary.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),

      // ثيم الأيقونات للوضع الفاتح
      iconTheme: IconThemeData(
        color: lightPrimary,
        size: 24,
      ),

      // ثيم شريط التطبيق للوضع الفاتح
      appBarTheme: AppBarTheme(
        backgroundColor: lightSurface,
        foregroundColor: lightOnSurface,
        elevation: 2,
        shadowColor: lightPrimary.withOpacity(0.1),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: lightOnSurface,
        ),
        iconTheme: IconThemeData(color: lightPrimary),
      ),

      // ثيم الحقول للوضع الفاتح
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: lightPrimary.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: lightPrimary.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: lightPrimary, width: 2),
        ),
        labelStyle: TextStyle(color: lightOnSurfaceVariant),
        hintStyle: TextStyle(color: lightOnSurfaceVariant.withOpacity(0.6)),
      ),
    );
  }

  // ========== دوال مساعدة للتدرجات ==========

  // تدرج سماوي (مثل المستخدم في المشروع)
  static LinearGradient get cyanGradient => LinearGradient(
        colors: [primaryCyan, secondaryCyan],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  // تدرج أزرق سماوي
  static LinearGradient get blueGradient => LinearGradient(
        colors: [secondaryCyan, primaryBlue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  // تدرج شفاف للحاويات
  static LinearGradient get transparentGradient => LinearGradient(
        colors: [
          primaryCyan.withOpacity(0.1),
          Colors.transparent,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  // ========== أنماط الصندوق للظلال ==========

  static List<BoxShadow> get cyanGlow => [
        BoxShadow(
          color: primaryCyan.withOpacity(0.3),
          blurRadius: 50,
          spreadRadius: 20,
        ),
      ];

  static List<BoxShadow> get cardShadow => [
        BoxShadow(
          color: primaryBlack.withOpacity(0.3),
          blurRadius: 20,
          spreadRadius: 1,
          offset: const Offset(0, 10),
        ),
      ];

  static List<BoxShadow> get buttonShadow => [
        BoxShadow(
          color: primaryCyan.withOpacity(0.5),
          blurRadius: 10,
          spreadRadius: 2,
          offset: const Offset(0, 4),
        ),
      ];
}

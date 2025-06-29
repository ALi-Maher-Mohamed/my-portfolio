import 'package:flutter/material.dart';

class CustomColors {
  static const Color scaffold1 = Color(0xFF1F242D);
  static const Color mainTextColor = Colors.amber;
  static const Color scaffold2 = Color(0xFF1F242D);
  static const Color secondaryTextColor = Colors.cyanAccent;
}

/// Light Theme Colors for Ali Maher Portfolio
/// مجموعة ألوان الوضع الفاتح لبورتفوليو علي ماهر
class AppLightTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // === Color Scheme ===
      colorScheme: ColorScheme.light(
        primary: LightThemeColors.primaryCyan,
        secondary: LightThemeColors.accentCyan,
        surface: LightThemeColors.bgCard,
        background: LightThemeColors.bgPrimary,
        onPrimary: LightThemeColors.textOnPrimary,
        onSecondary: LightThemeColors.textPrimary,
        onSurface: LightThemeColors.textPrimary,
        onBackground: LightThemeColors.textPrimary,
      ),

      // === Scaffold Theme ===
      scaffoldBackgroundColor: LightThemeColors.bgPrimary,

      // === App Bar Theme ===
      appBarTheme: const AppBarTheme(
        backgroundColor: LightThemeColors.bgCard,
        foregroundColor: LightThemeColors.textPrimary,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),

      // === Card Theme ===
      cardTheme: CardTheme(
        color: LightThemeColors.bgCard,
        shadowColor: LightThemeColors.shadowSoft,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // === Text Theme ===
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: LightThemeColors.textPrimary,
          fontSize: 48,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
        ),
        displayMedium: TextStyle(
          color: LightThemeColors.textPrimary,
          fontSize: 36,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
        headlineLarge: TextStyle(
          color: LightThemeColors.textPrimary,
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
        ),
        bodyLarge: TextStyle(
          color: LightThemeColors.textSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          color: LightThemeColors.textMuted,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.4,
        ),
      ),

      // === Button Theme ===
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: LightThemeColors.buttonPrimary,
          foregroundColor: LightThemeColors.textOnPrimary,
          shadowColor: LightThemeColors.shadowSoft,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: LightThemeColors.primaryIndigo,
          side: BorderSide(
              color: LightThemeColors.primaryIndigo.withOpacity(0.3)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
        ),
      ),

      // === Icon Theme ===
      iconTheme: const IconThemeData(
        color: LightThemeColors.iconPrimary,
        size: 24,
      ),

      // === Divider Theme ===
      dividerTheme: DividerThemeData(
        color: LightThemeColors.borderLight,
        thickness: 0.8,
      ),
    );
  }
}

class LightThemeColors {
  // === Primary Colors ===
  // الألوان الأساسية
  static const Color primaryCyan = Color(0xFF6366F1);
  static const Color primaryCyanLight = Color(0xFF818CF8);
  static const Color primaryCyanDark = Color(0xFF4F46E5);
  static const Color accentCyan = Color(0xFF8B5CF6);
  static const Color primaryIndigo =
      Color(0xFF6366F1); // Added to fix primaryIndigo error

  // === Background Colors ===
  // ألوان الخلفيات
  static const Color bgPrimary = Color(0xFFFAFAFC);
  static const Color bgSecondary = Color(0xFFF1F5F9);
  static const Color bgCard = Color(0xFFFFFFFF);
  static const Color bgGradientStart = Color(0xFFF8FAFC);
  static const Color bgGradientEnd = Color(0xFFE2E8F0);

  // === Text Colors ===
  // ألوان النصوص
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // === UI Element Colors ===
  // ألوان عناصر الواجهة
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color borderMedium = Color(0xFFCBD5E1);
  static const Color shadowLight = Color(0x1A64748B);
  static const Color shadowMedium = Color(0x2664748B);
  static const Color shadowSoft =
      Color(0x1A64748B); // Added to fix shadowSoft error

  // === Social Media Colors ===
  // ألوان وسائل التواصل الاجتماعي
  static const Color facebook = Color(0xFF1877F2);
  static const Color linkedin = Color(0xFF0A66C2);
  static const Color github = Color(0xFF24292E);
  static const Color email = Color(0xFF4285F4);

  // === Status Colors ===
  // ألوان الحالة
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFF43F5E);
  static const Color info = Color(0xFF3B82F6);

  // === Button Colors ===
  // ألوان الأزرار
  static const Color buttonPrimary = primaryCyan;
  static const Color buttonSecondary = Color(0xFFF1F5F9);
  static const Color buttonHover = Color(0xFF4F46E5);
  static const Color buttonPressed = Color(0xFF3730A3);

  // === Hexagon Shape Colors ===
  // ألوان الشكل السداسي
  static const Color hexagonPrimary = primaryCyan;
  static const Color hexagonSecondary = accentCyan;
  static const Color hexagonBorder = primaryCyanLight;

  // === Icon Colors ===
  // ألوان الأيقونات
  static const Color iconPrimary = Color(0xFF475569);
  static const Color iconSecondary = Color(0xFF94A3B8);
  static const Color iconAccent = primaryCyan;
}

/// Enhanced Gradients for Light Theme
/// التدرجات المحسنة للثيم الفاتح
class LightThemeGradients {
  // === Primary Gradient - تدرج أساسي أنيق ===
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF6366F1), // Indigo 500
      Color(0xFF8B5CF6), // Purple 500
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // === Background Gradient - تدرج الخلفية ===
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [
      Color(0xFFFAFAFC), // Off-white
      Color(0xFFF1F5F9), // Slate 100
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // === Button Gradient - تدرج الأزرار ===
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [
      Color(0xFF6366F1), // Indigo 500
      Color(0xFF4F46E5), // Indigo 600
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // === Card Gradient - تدرج البطاقات ===
  static const LinearGradient cardGradient = LinearGradient(
    colors: [
      Color(0xFFFFFFFF), // White
      Color(0xFFF8FAFC), // Slate 50
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // === Accent Gradient - تدرج مميز ===
  static const LinearGradient accentGradient = LinearGradient(
    colors: [
      Color(0xFF8B5CF6), // Purple 500
      Color(0xFFF43F5E), // Rose 500
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // === Success Gradient - تدرج النجاح ===
  static const LinearGradient successGradient = LinearGradient(
    colors: [
      Color(0xFF10B981), // Emerald 500
      Color(0xFF059669), // Emerald 600
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

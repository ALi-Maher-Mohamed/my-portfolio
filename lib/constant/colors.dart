import 'package:flutter/material.dart';

class CustomColors {
  // خلفيات داكنة متدرجة
  static const Color scaffold1 = Color(0xFF1a1d29); // خلفية داكنة أساسية
  static const Color scaffold2 = Color(0xFF252831); // خلفية ثانوية
  static const Color cardBackground = Color(0xFF2a2d3a); // خلفية البطاقات

  // ألوان النص
  static const Color mainTextColor =
      Color(0xFF00d4ff); // أزرق سماوي للنصوص الأساسية
  static const Color secondaryTextColor =
      Color(0xFFffffff); // أبيض للنصوص الثانوية
  static const Color subtitleTextColor =
      Color(0xFFa0a5b8); // رمادي فاتح للنصوص الفرعية

  // ألوان الأزرار والعناصر التفاعلية
  static const Color primaryButton = Color(0xFF00d4ff); // أزرق سماوي
  static const Color secondaryButton = Color(0xFF4facfe); // أزرق متدرج
  static const Color accentColor = Color(0xFF00bcd4); // أزرق داكن للتمييز

  // ألوان المهارات والإحصائيات
  static const Color skillBlue = Color(0xFF2196f3);
  static const Color skillCyan = Color(0xFF00bcd4);
  static const Color skillTeal = Color(0xFF009688);
  static const Color skillGreen = Color(0xFF4caf50);
  static const Color skillOrange = Color(0xFFff9800);
  static const Color skillPurple = Color(0xFF9c27b0);

  // ألوان الخدمات
  static const Color serviceIcon1 = Color(0xFF00d4ff);
  static const Color serviceIcon2 = Color(0xFF4facfe);
  static const Color serviceIcon3 = Color(0xFF00bcd4);

  // ألوان التدرج
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF4facfe), Color(0xFF00d4ff)],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1a1d29), Color(0xFF252831)],
  );

  // ألوان الحدود والظلال
  static const Color borderColor = Color(0xFF3a3d4a);
  static const Color shadowColor = Color(0xFF000000);

  // ألوان الحالة
  static const Color successColor = Color(0xFF4caf50);
  static const Color warningColor = Color(0xFFff9800);
  static const Color errorColor = Color(0xFFf44336);
}

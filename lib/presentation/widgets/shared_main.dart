import 'package:Ali_Maher/core/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainShared {
  static List<Map<String, dynamic>> getSocialIcons(bool isLightMode) {
    return [
      {
        'icon': FontAwesomeIcons.facebook,
        'url': 'https://www.facebook.com/ali.maher.403247',
        'color': isLightMode ? LightThemeColors.primaryCyan : Colors.cyan,
      },
      {
        'icon': FontAwesomeIcons.linkedin,
        'url': 'https://www.linkedin.com/in/ali-maher-maher',
        'color': isLightMode ? LightThemeColors.primaryCyan : Colors.cyan,
      },
      {
        'icon': FontAwesomeIcons.envelope,
        'url': 'mailto:ali.maher0013@gmail.com?subject=Hello',
        'color': isLightMode ? LightThemeColors.primaryCyan : Colors.cyan,
      },
      {
        'icon': FontAwesomeIcons.github,
        'url': 'https://github.com/ALi-Maher-Mohamed',
        'color': isLightMode ? LightThemeColors.primaryCyan : Colors.cyan,
      },
    ];
  }

  static AnimationController createFadeController(TickerProvider vsync) {
    return AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: vsync,
    );
  }

  static AnimationController createSlideController(TickerProvider vsync) {
    return AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: vsync,
    );
  }

  static AnimationController createTypewriterController(TickerProvider vsync) {
    return AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: vsync,
    );
  }

  static AnimationController createBounceController(TickerProvider vsync) {
    return AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: vsync,
    );
  }

  static AnimationController createIconController(TickerProvider vsync) {
    return AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: vsync,
    );
  }

  static Animation<double> createFadeAnimation(AnimationController controller) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  static Animation<Offset> createSlideAnimation(
      AnimationController controller) {
    return Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut));
  }

  static Animation<double> createBounceAnimation(
      AnimationController controller) {
    return Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticOut),
    );
  }

  static Animation<double> createIconAnimation(AnimationController controller) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticOut),
    );
  }

  static Color getTextColor(bool isLightMode, bool isPrimary) {
    return isLightMode
        ? (isPrimary
            ? LightThemeColors.textPrimary
            : LightThemeColors.textSecondary)
        : (isPrimary ? Colors.white : Colors.white70);
  }

  static Color getAccentColor(bool isLightMode) {
    return isLightMode ? LightThemeColors.primaryCyan : Colors.cyan;
  }

  static Color getCardColor(bool isLightMode) {
    return isLightMode
        ? LightThemeColors.accentCyan.withOpacity(0.1)
        : Colors.cyan.withOpacity(0.1);
  }

  static Color getBorderColor(bool isLightMode) {
    return isLightMode
        ? LightThemeColors.borderLight
        : Colors.cyan.withOpacity(0.2);
  }
}

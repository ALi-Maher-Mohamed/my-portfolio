import 'package:Ali_Maher/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        // إضافة padding مريح
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        // إضافة شكل مدور
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        // لون الخلفية عند الضغط
        backgroundColor: Colors.transparent,
        overlayColor: isLightMode
            ? LightThemeColors.primaryCyan.withOpacity(0.1)
            : LightThemeColors.hexagonSecondary,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600, // وزن أفضل للنص
          fontSize: MediaQuery.of(context).size.width / 85, // حجم أفضل
          color: isLightMode
              ? LightThemeColors.primaryCyan // الأزرق الجديد بدلاً من السماوي
              : Colors.cyanAccent,
          letterSpacing: 0.3, // تباعد أحرف أفضل
        ),
      ),
    );
  }
}

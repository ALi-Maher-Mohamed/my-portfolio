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
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: MediaQuery.of(context).size.width / 90,
          color: isLightMode ? LightThemeColors.accentCyan : Colors.white,
        ),
      ),
    );
  }
}

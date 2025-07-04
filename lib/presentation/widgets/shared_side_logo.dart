import 'package:Ali_Maher/core/constant/theme.dart';
import 'package:flutter/material.dart';

class SideLogo extends StatelessWidget {
  const SideLogo({
    this.onTap,
    super.key,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return GestureDetector(
      onTap: onTap,
      child: Text(
        'AM',
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: isLightMode ? LightThemeColors.primaryCyan : Colors.cyan,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:Ali_Maher/presentation/widgets/shared_side_logo.dart';
import 'package:Ali_Maher/core/constant/theme.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({
    super.key,
    this.onLogoTap,
    this.onMenuTap,
  });

  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            SideLogo(
              onTap: onLogoTap,
            ),
            const Spacer(),
            // زر القائمة محسن
            Container(
              decoration: BoxDecoration(
                color: isLightMode
                    ? LightThemeColors.primaryCyan.withOpacity(0.1)
                    : Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isLightMode
                      ? LightThemeColors.primaryCyan.withOpacity(0.2)
                      : Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: IconButton(
                onPressed: onMenuTap,
                icon: Icon(
                  Icons.menu_rounded, // أيقونة أكثر نعومة
                  color:
                      isLightMode ? LightThemeColors.primaryCyan : Colors.white,
                  size: 24,
                ),
                // تأثير تفاعلي
                style: IconButton.styleFrom(
                  overlayColor: isLightMode
                      ? LightThemeColors.primaryCyan.withOpacity(0.1)
                      : Colors.white.withOpacity(0.1),
                  padding: const EdgeInsets.all(12),
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}

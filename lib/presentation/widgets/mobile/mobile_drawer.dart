import 'package:Ali_Maher/presentation/widgets/shared_them_toggle.dart';
import 'package:flutter/material.dart';
import 'package:Ali_Maher/core/constant/theme.dart';
import '../../../core/constant/nav_titles_and_func.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
    required this.onScrollToIndex,
  });
  final bool isDarkMode;
  final void Function(int) onScrollToIndex;

  final ValueChanged<bool> onThemeToggle;
  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Drawer(
      backgroundColor:
          isLightMode ? LightThemeColors.bgCard : CustomColors.scaffold1,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Header مع تدرج جميل
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient:
                    isLightMode ? LightThemeGradients.primaryGradient : null,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // أيقونة المستخدم
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person_rounded,
                      size: 40,
                      color: isLightMode
                          ? LightThemeColors.bgCard
                          : CustomColors.secondaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Ali Maher',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: isLightMode
                          ? LightThemeColors.bgCard
                          : CustomColors.secondaryTextColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ),

            // قائمة العناصر
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: navTiltles.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.transparent,
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      // تأثير hover
                      hoverColor: isLightMode
                          ? LightThemeColors.primaryCyan.withOpacity(0.1)
                          : CustomColors.secondaryTextColor.withOpacity(0.1),
                      // لون عند الضغط
                      splashColor: isLightMode
                          ? LightThemeColors.primaryCyan.withOpacity(0.2)
                          : CustomColors.secondaryTextColor.withOpacity(0.5),

                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: LightThemeColors.primaryCyan.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          navIcons[i],
                          color: isLightMode
                              ? LightThemeColors.primaryCyan
                              : CustomColors.secondaryTextColor,
                          size: 22,
                        ),
                      ),

                      title: Text(
                        navTiltles[i],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isLightMode
                              ? LightThemeColors.textPrimary
                              : CustomColors.secondaryTextColor,
                          letterSpacing: 0.3,
                        ),
                      ),

                      // سهم صغير على اليمين
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                        color: isLightMode
                            ? LightThemeColors.textMuted
                            : CustomColors.secondaryTextColor,
                      ),

                      onTap: () {
                        onScrollToIndex(i);
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              ),
            ),
            ThemeToggleSwitch(isDarkMode: isDarkMode, onToggle: onThemeToggle),
            // Footer
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Divider(
                    color: isLightMode
                        ? LightThemeColors.borderLight
                        : CustomColors.secondaryTextColor,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Version 1.0.0',
                    style: TextStyle(
                      fontSize: 12,
                      color: isLightMode
                          ? LightThemeColors.textMuted
                          : CustomColors.secondaryTextColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

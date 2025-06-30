import 'package:Ali_Maher/presentation/widgets/web/custom_nav_text_button.dart';
import 'package:Ali_Maher/presentation/widgets/side_logo.dart';
import 'package:Ali_Maher/presentation/widgets/them_toggle.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/nav_titles_and_func.dart';

class WebHeader extends StatelessWidget {
  final void Function(int) onNavItemTap;
  final bool isDarkMode;
  final ValueChanged<bool> onThemeToggle;

  const WebHeader({
    super.key,
    required this.onNavItemTap,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: MediaQuery.of(context).size.height / 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo section
          SideLogo(
            onTap: () => onNavItemTap(0), // Home section
          ),

          const SizedBox(width: 20),

          // Theme toggle switch
          ThemeToggleSwitch(
            isDarkMode: isDarkMode,
            onToggle: onThemeToggle,
            width: 60,
            height: 30,
          ),

          // Spacer to push navigation to the right
          SizedBox(width: MediaQuery.of(context).size.width / 2 - 200),

          // Navigation buttons
          Row(
            children: [
              for (int i = 0; i < navTiltles.length; i++)
                CustomTextButton(
                  onPressed: () => onNavItemTap(i),
                  title: navTiltles[i],
                ),
            ],
          )
        ],
      ),
    );
  }
}

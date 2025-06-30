import 'package:Ali_Maher/core/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:Ali_Maher/presentation/widgets/hexagon_image.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    // Check if the current theme is light mode
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Expanded(
      child: Container(
        height: screenHeight,
        constraints: const BoxConstraints(minHeight: 560),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const HexagonAnimatedImage(), // Assumes it handles its own theming
            const SizedBox(height: 20),
            Text(
              "Hi,\nI'm Ali Maher\nMobile Developer",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: isLightMode
                    ? LightThemeColors.primaryCyanDark
                    : CustomColors
                        .secondaryTextColor, // Original dark mode style
                height: 2,
              ),
            ),
            ElevatedButton(
              style: isLightMode
                  ? Theme.of(context)
                      .elevatedButtonTheme
                      .style // Use light theme button style
                  : ElevatedButton.styleFrom(
                      minimumSize:
                          const Size(200, 50), // Original dark mode style
                    ),
              onPressed: () {},
              child: Text(
                'Get In Touch',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isLightMode
                        ? LightThemeColors.primaryCyan
                        : Colors.white), // Dark mode text style
              ),
            ),
          ],
        ),
      ),
    );
  }
}

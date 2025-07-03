import 'package:Ali_Maher/core/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:Ali_Maher/presentation/widgets/web/animated_brief_web.dart';
import 'package:Ali_Maher/presentation/widgets/shared_hexagon_image.dart';

class MainWeb extends StatelessWidget {
  const MainWeb({
    super.key,
    required this.screenSize,
    required this.screenHeight,
    required this.onScrollToIndex,
  });

  final Size screenSize;
  final double screenHeight;
  final void Function(int) onScrollToIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        height: screenHeight / 1.2,
        constraints: const BoxConstraints(maxWidth: 1200, minHeight: 350),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedPortfolioBrief(),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                  ),
                  onPressed: () {
                    onScrollToIndex(5);
                  },
                  child: Text(
                    'Get In Touch',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.light
                            ? LightThemeColors.primaryCyan
                            : Colors.white),
                  ),
                )
              ],
            ),
            FittedBox(
              child: HexagonAnimatedImage(),
            ),
          ],
        ),
      ),
    );
  }
}

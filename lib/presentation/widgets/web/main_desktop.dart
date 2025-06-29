import 'package:flutter/material.dart';
import 'package:Ali_Maher/presentation/widgets/web/animated_brief_desktop.dart';
import 'package:Ali_Maher/presentation/widgets/hexagon_image.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({
    super.key,
    required this.screenSize,
    required this.screenWidth,
    required this.screenHeight,
    required this.onScrollToIndex,
  });

  final Size screenSize;
  final double screenHeight;
  final void Function(int) onScrollToIndex;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 22),
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
                    style: Theme.of(context).textTheme.bodySmall,
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

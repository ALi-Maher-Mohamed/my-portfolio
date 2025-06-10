import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/animated_brief_desktop.dart';
import 'package:my_portfolio/widgets/hexagon_image.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({
    super.key,
    required this.screenSize,
    required this.screenWidth,
    required this.screenHeight,
  });

  final Size screenSize;
  final double screenHeight;
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
                  onPressed: () {},
                  child: Text(
                    'Get In Touch',
                    style: Theme.of(context).textTheme.bodyMedium,
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

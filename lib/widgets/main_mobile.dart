import 'package:flutter/material.dart';

import '../constant/colors.dart';

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
    return Expanded(
      child: Container(
        height: screenHeight,
        constraints: BoxConstraints(minHeight: 560),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  colors: [
                    CustomColors.scaffold1.withOpacity(0.6),
                    CustomColors.scaffold1.withOpacity(0.6),
                  ],
                ).createShader(rect);
              },
              blendMode: BlendMode.srcATop,
              child: Image.asset(
                'assets/MyPhoto/Ali1.jpg',
                width: screenWidth / 2,
                height: screenHeight / 3.5,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Hi,\nI'm Ali Maher\nFlutter Developer",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.5),
            ),
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
      ),
    );
  }
}

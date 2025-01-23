import 'package:flutter/material.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({
    super.key,
    required this.screenSize,
    required this.screenWidth,
  });

  final Size screenSize;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 22),
        height: screenSize.height / 1.2,
        constraints: const BoxConstraints(maxWidth: 1200, minHeight: 350),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hi,\nI'm Ali Maher\nFlutter Developer",
                  style: TextStyle(
                      fontSize: 30,
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
            FittedBox(
              child: Image.asset(
                "assets/MyPhoto/Ali1.jpg",
                width: screenWidth * 0.4,
              ),
            )
          ],
        ),
      ),
    );
  }
}

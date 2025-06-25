// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:Ali_Maher/core/styles/hexagon_clipper.dart';

class HexagonAnimatedImage extends StatefulWidget {
  const HexagonAnimatedImage({super.key});

  @override
  State<HexagonAnimatedImage> createState() => _HexagonAnimatedImageState();
}

class _HexagonAnimatedImageState extends State<HexagonAnimatedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _floatingAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); // for floating

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.4)),
    );

    _floatingAnimation = Tween<double>(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.translate(
            offset: Offset(0, _floatingAnimation.value),
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Shadow
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 270,
                      width: 220,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 1,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Background color
                  ClipPath(
                    clipper: HexagonClipper(),
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.cyan, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),

                  // Glow effect behind
                  Container(
                    height: 270,
                    width: 240,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyanAccent.withOpacity(0.3),
                          blurRadius: 50,
                          spreadRadius: 20,
                        ),
                      ],
                    ),
                  ),

                  // Main image in hexagon
                  ClipPath(
                    clipper: HexagonClipper(),
                    child: Image.asset(
                      'assets/MyPhoto/my_photo1.png',
                      height: 450,
                      width: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

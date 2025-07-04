// ignore_for_file: deprecated_member_use

import 'package:Ali_Maher/core/constant/theme.dart';
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
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    final screenWidth = MediaQuery.of(context).size.width;

    // تحديد الحجم بناءً على نوع الجهاز
    // للموبايل: أقل من 600px
    // للتابلت: من 600px إلى 1200px
    // للويب: أكبر من 1200px
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1200;

    // تحديد أحجام مختلفة حسب الجهاز
    final double containerSize = isMobile
        ? 200
        : isTablet
            ? 250
            : 300;
    final double shadowHeight = isMobile
        ? 180
        : isTablet
            ? 225
            : 270;
    final double shadowWidth = isMobile
        ? 150
        : isTablet
            ? 185
            : 220;
    final double glowHeight = isMobile
        ? 180
        : isTablet
            ? 225
            : 270;
    final double glowWidth = isMobile
        ? 160
        : isTablet
            ? 200
            : 240;
    final double imageHeight = isMobile
        ? 350
        : isTablet
            ? 425
            : 500;
    final double imageWidth = isMobile
        ? 280
        : isTablet
            ? 340
            : 400;
    final double floatingRange = isMobile ? 6.0 : 10.0;
    final double blurRadius = isMobile ? 35 : 50;
    final double spreadRadius = isMobile ? 12 : 20;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.translate(
            offset:
                Offset(0, _floatingAnimation.value * (floatingRange / 10.0)),
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Shadow
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: shadowHeight,
                      width: shadowWidth,
                      decoration: BoxDecoration(
                        color: isLightMode
                            ? LightThemeColors.bgSecondary.withOpacity(0.05)
                            : Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: isLightMode
                                ? LightThemeColors.shadowLight
                                : Colors.black.withOpacity(0.3),
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
                      height: containerSize,
                      width: containerSize,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: isLightMode
                              ? [
                                  LightThemeColors.primaryCyan,
                                  LightThemeColors.bgSecondary,
                                ]
                              : [Colors.cyan, Colors.blueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),

                  // Glow effect behind
                  Container(
                    height: glowHeight,
                    width: glowWidth,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: isLightMode
                              ? LightThemeColors.primaryCyan.withOpacity(0.3)
                              : Colors.cyan.withOpacity(0.3),
                          blurRadius: blurRadius,
                          spreadRadius: spreadRadius,
                        ),
                      ],
                    ),
                  ),

                  // Main image in hexagon
                  ClipPath(
                    clipper: HexagonClipper(),
                    child: Image.asset(
                      'assets/MyPhoto/my_photo1.png',
                      height: imageHeight,
                      width: imageWidth,
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

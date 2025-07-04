import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:Ali_Maher/core/constant/theme.dart';

final List<Map<String, String>> portfolioItems = [
  {
    'title': 'MediCare Platform',
    'image': 'assets/images/Rectangle.png',
    'category': 'Medical / Web & Mobile',
    'route': 'https://github.com/ALi-Maher-Mohamed/MediaCare',
  },
  {
    'title': 'Reading App',
    'image': 'assets/images/Rectangle0.png',
    'category': 'Flutter / MVVM',
    'route': 'https://github.com/ALi-Maher-Mohamed/Bookly-app',
  },
  {
    'title': 'Tic-Tac-Toe Game',
    'image': 'assets/images/Rectangle5.png',
    'category': 'Game / Flutter',
    'route': 'https://github.com/ALi-Maher-Mohamed/Tic-Tac-Game',
  },
  {
    'title': 'BMI Calculator',
    'image': 'assets/images/Rectangle5.png',
    'category': 'Health / Flutter',
    'route': 'https://github.com/ALi-Maher-Mohamed/BMI-App',
  },
  {
    'title': 'Notes App',
    'image': 'assets/images/Rectangle6.png',
    'category': 'Notes / Flutter',
    'route': 'https://github.com/ALi-Maher-Mohamed/notes_app',
  },
  {
    'title': 'News Reader App',
    'image': 'assets/images/Rectangle7.png',
    'category': 'News / Flutter',
    'route': 'https://github.com/ALi-Maher-Mohamed/News-App',
  },
  {
    'title': 'Weather Forecast App',
    'image': 'assets/images/Rectangle9.png',
    'category': 'Utility / API Integration',
    'route': 'https://github.com/ALi-Maher-Mohamed/Weather_App_with_cubit',
  },
];

// الدوال المشتركة
class ResponsiveHelper {
  static double getHorizontalPadding(double screenWidth) {
    if (screenWidth > 1400) return 80;
    if (screenWidth > 1200) return 60;
    if (screenWidth > 900) return 40;
    return 20;
  }

  static double getVerticalPadding(double screenWidth) {
    if (screenWidth > 1200) return 80;
    if (screenWidth > 900) return 60;
    return 40;
  }

  static double getSectionSpacing(double screenWidth) {
    if (screenWidth > 1200) return 40;
    if (screenWidth > 900) return 30;
    return 30;
  }

  static double getTitleFontSize(double screenWidth) {
    if (screenWidth > 1400) return 56;
    if (screenWidth > 1200) return 48;
    if (screenWidth > 900) return 42;
    return 36;
  }

  static double getUnderlineWidth(double screenWidth) {
    if (screenWidth > 1200) return 100;
    if (screenWidth > 900) return 80;
    return 60;
  }

  static double getCardHeight(double screenWidth) {
    if (screenWidth > 1200) return 450;
    if (screenWidth > 900) return 400;
    return 350;
  }

  static double getAxisSpacing(double screenWidth) {
    if (screenWidth > 1200) return 20;
    if (screenWidth > 900) return 15;
    return 10;
  }

  static double getImageSize(double screenWidth) {
    if (screenWidth > 1200) return 60;
    if (screenWidth > 900) return 50;
    return 45;
  }

  static double getSkillFontSize(double screenWidth) {
    if (screenWidth > 1200) return 16;
    if (screenWidth > 900) return 14;
    return 12;
  }

  static double getSkillPadding(double screenWidth) {
    if (screenWidth > 1200) return 16;
    if (screenWidth > 900) return 12;
    return 10;
  }

  static IconData getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.menu_book;
      case 1:
        return Icons.local_hospital;
      case 2:
        return Icons.shopping_cart;
      case 3:
        return Icons.dashboard;
      case 4:
        return Icons.newspaper;
      case 5:
        return Icons.cloud;
      default:
        return Icons.code;
    }
  }
}

// عنوان القسم المشترك
class SectionHeader extends StatelessWidget {
  final double screenWidth;
  final bool isLightMode;

  const SectionHeader({
    super.key,
    required this.screenWidth,
    required this.isLightMode,
  });

  @override
  Widget build(BuildContext context) {
    final fontSize = ResponsiveHelper.getTitleFontSize(screenWidth);

    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "My ",
                style: TextStyle(
                  color:
                      isLightMode ? LightThemeColors.textPrimary : Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
              TextSpan(
                text: "Projects",
                style: TextStyle(
                  color:
                      isLightMode ? LightThemeColors.primaryCyan : Colors.cyan,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: ResponsiveHelper.getUnderlineWidth(screenWidth),
          height: 4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isLightMode
                  ? [
                      LightThemeColors.primaryCyan,
                      LightThemeColors.primaryCyan.withOpacity(0.3),
                    ]
                  : [
                      Colors.cyan,
                      Colors.cyan.withOpacity(0.3),
                    ],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    ).animate().fadeIn(duration: const Duration(milliseconds: 400)).slideY(
          begin: -0.3,
          end: 0.0,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 600),
        );
  }
}

// مؤشرات الصفحات المشتركة
class PageIndicators extends StatelessWidget {
  final double screenWidth;
  final bool isLightMode;
  final int currentPage;
  final int crossAxisCount;

  const PageIndicators({
    super.key,
    required this.screenWidth,
    required this.isLightMode,
    required this.currentPage,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: ResponsiveHelper.getSectionSpacing(screenWidth)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          (portfolioItems.length / crossAxisCount).ceil(),
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: currentPage == index ? 12 : 8,
            height: currentPage == index ? 12 : 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPage == index
                  ? (isLightMode ? LightThemeColors.primaryCyan : Colors.cyan)
                  : (isLightMode ? LightThemeColors.textMuted : Colors.grey),
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 400)).slideY(
          begin: 0.3,
          end: 0.0,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 600),
        );
  }
}

// الزر المتحرك المشترك
class HoverAnimatedButton extends StatefulWidget {
  final Widget child;

  const HoverAnimatedButton({super.key, required this.child});

  @override
  State<HoverAnimatedButton> createState() => _HoverAnimatedButtonState();
}

class _HoverAnimatedButtonState extends State<HoverAnimatedButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: widget.child,
      ),
    );
  }
}

// كارت المشروع المتحرك المشترك
class HoverAnimatedPortfolioCard extends StatefulWidget {
  final Widget child;
  final int index;

  const HoverAnimatedPortfolioCard({
    super.key,
    required this.child,
    required this.index,
  });

  @override
  State<HoverAnimatedPortfolioCard> createState() =>
      _HoverAnimatedPortfolioCardState();
}

class _HoverAnimatedPortfolioCardState
    extends State<HoverAnimatedPortfolioCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: widget.child
            .animate(delay: Duration(milliseconds: 100 * widget.index))
            .fadeIn(duration: const Duration(milliseconds: 400))
            .slideX(begin: 0.3, end: 0.0, curve: Curves.easeOut),
      ),
    );
  }
}

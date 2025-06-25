import 'package:Ali_Maher/core/constant/colors.dart';
import 'package:Ali_Maher/core/constant/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyProjectsWeb extends StatelessWidget {
  const MyProjectsWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 1200;
    final isMediumScreen = screenWidth > 900 && screenWidth <= 1200;

    return Container(
      color: CustomColors.scaffold2,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: _buildHorizontalPadding(screenWidth),
        vertical: _getVerticalPadding(screenWidth),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSectionHeader(screenWidth),
            SizedBox(height: _getSectionSpacing(screenWidth)),
            _buildPortfolioGrid(
                context, screenWidth, isLargeScreen, isMediumScreen),
            _buildSeeMoreButton(context, screenWidth),
          ],
        ),
      ),
    );
  }

  double _buildHorizontalPadding(double screenWidth) {
    if (screenWidth > 1400) return 80;
    if (screenWidth > 1200) return 60;
    if (screenWidth > 900) return 40;
    return 20;
  }

  double _getVerticalPadding(double screenWidth) {
    if (screenWidth > 1200) return 80;
    if (screenWidth > 900) return 60;
    return 40;
  }

  double _getSectionSpacing(double screenWidth) {
    if (screenWidth > 1200) return 40;
    if (screenWidth > 900) return 30;
    return 30;
  }

  Widget _buildSectionHeader(double screenWidth) {
    final fontSize = _getTitleFontSize(screenWidth);

    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "My ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
              TextSpan(
                text: "Projects",
                style: TextStyle(
                  color: Colors.cyanAccent,
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
          width: _getUnderlineWidth(screenWidth),
          height: 4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyanAccent, Colors.cyanAccent.withOpacity(0.3)],
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

  double _getTitleFontSize(double screenWidth) {
    if (screenWidth > 1400) return 56;
    if (screenWidth > 1200) return 48;
    if (screenWidth > 900) return 42;
    return 36;
  }

  double _getUnderlineWidth(double screenWidth) {
    if (screenWidth > 1200) return 100;
    if (screenWidth > 900) return 80;
    return 60;
  }

  Widget _buildPortfolioGrid(BuildContext context, double screenWidth,
      bool isLargeScreen, bool isMediumScreen) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double availableWidth = constraints.maxWidth;
        double cardWidth = (availableWidth - (isLargeScreen ? 40 : 20)) /
            (isLargeScreen
                ? 3
                : isMediumScreen
                    ? 2
                    : 1);
        double cardHeight = cardWidth / 1.4;
        double totalHeight = ((cardHeight + 20) *
            (isLargeScreen
                ? 2
                : isMediumScreen
                    ? 3
                    : 6));

        return SizedBox(
          height: totalHeight,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isLargeScreen
                  ? 3
                  : isMediumScreen
                      ? 2
                      : 1,
              childAspectRatio: 1.4,
              crossAxisSpacing: isLargeScreen ? 20 : 10,
              mainAxisSpacing: 20,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return _buildPortfolioCard(context, index, screenWidth);
            },
          ),
        );
      },
    ).animate().fadeIn(duration: const Duration(milliseconds: 600)).slideY(
          begin: 0.3,
          end: 0.0,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 800),
        );
  }

  Widget _buildPortfolioCard(
      BuildContext context, int index, double screenWidth) {
    final portfolioItems = [
      {
        'title': 'Reading App',
        'image': 'assets/images/Rectangle0.png',
        'category': 'Flutter / MVVM',
        'route': '/project-details/0',
      },
      {
        'title': 'MediCare Platform',
        'image': 'assets/images/Rectangle.png',
        'category': 'Medical / Web & Mobile',
        'route': '/project-details/1',
      },
      {
        'title': 'E-Commerce Store',
        'image': 'assets/images/Rectangle5.png',
        'category': 'Shopping / Flutter',
        'route': '/project-details/2',
      },
      {
        'title': 'Responsive Dashboard',
        'image': 'assets/images/Rectangle6.png',
        'category': 'UI / Responsive Design',
        'route': '/project-details/3',
      },
      {
        'title': 'News Reader App',
        'image': 'assets/images/Rectangle7.png',
        'category': 'News / Flutter',
        'route': '/project-details/4',
      },
      {
        'title': 'Weather Forecast App',
        'image': 'assets/images/Rectangle9.png',
        'category': 'Utility / API Integration',
        'route': '/project-details/5',
      },
    ];
    final item = portfolioItems[index];

    return _HoverAnimatedPortfolioCard(
      index: index,
      child: GestureDetector(
        onDoubleTap: () {
          Navigator.pushNamed(context, item['route'] as String);
          print('Double tapped on portfolio item $index');
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2C3E50).withOpacity(0.8),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.cyanAccent.withOpacity(0.2),
              width: 1,
            ),
            image: DecorationImage(
              image: AssetImage(item['image'] as String),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.darken,
              ),
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.center,
                      radius: 1.0,
                      colors: [
                        Colors.white.withOpacity(0.1),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: _getImageSize(screenWidth),
                        height: _getImageSize(screenWidth),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: ClipOval(
                          child: Icon(
                            _getIconForIndex(index),
                            size: _getImageSize(screenWidth) * 0.6,
                            color: Colors.cyanAccent,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        item['title'] as String,
                        style: TextStyle(
                          fontSize: _getSkillFontSize(screenWidth) + 2,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          item['category'] as String,
                          style: TextStyle(
                            fontSize: _getSkillFontSize(screenWidth) - 2,
                            color: Colors.cyanAccent.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _getImageSize(double screenWidth) {
    if (screenWidth > 1200) return 60;
    if (screenWidth > 900) return 50;
    return 45;
  }

  double _getSkillFontSize(double screenWidth) {
    if (screenWidth > 1200) return 16;
    if (screenWidth > 900) return 14;
    return 12;
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.web;
      case 1:
        return Icons.phone_android;
      case 2:
        return Icons.sports_esports;
      case 3:
        return Icons.desktop_mac;
      case 4:
        return Icons.mouse;
      case 5:
        return Icons.keyboard;
      default:
        return Icons.code;
    }
  }

  Widget _buildSeeMoreButton(BuildContext context, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(top: _getSectionSpacing(screenWidth)),
      child: _HoverAnimatedButton(
        child: ElevatedButton(
          onPressed: () {
            launchCustomUrl(context,
                url: 'https://github.com/ALi-Maher-Mohamed?tab=repositories');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyanAccent,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: _getSkillPadding(screenWidth) * 2,
              vertical: _getSkillPadding(screenWidth),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: TextStyle(
              fontSize: _getSkillFontSize(screenWidth),
              fontWeight: FontWeight.w700,
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('See More'),
              SizedBox(width: 10),
              Icon(Icons.arrow_forward, size: 18),
            ],
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

  double _getSkillPadding(double screenWidth) {
    if (screenWidth > 1200) return 16;
    if (screenWidth > 900) return 12;
    return 10;
  }
}

class _HoverAnimatedPortfolioCard extends StatefulWidget {
  final Widget child;
  final int index;

  const _HoverAnimatedPortfolioCard({
    required this.child,
    required this.index,
    super.key,
  });

  @override
  State<_HoverAnimatedPortfolioCard> createState() =>
      _HoverAnimatedPortfolioCardState();
}

class _HoverAnimatedPortfolioCardState
    extends State<_HoverAnimatedPortfolioCard> {
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

class _HoverAnimatedButton extends StatefulWidget {
  final Widget child;

  const _HoverAnimatedButton({required this.child, super.key});

  @override
  State<_HoverAnimatedButton> createState() => _HoverAnimatedButtonState();
}

class _HoverAnimatedButtonState extends State<_HoverAnimatedButton> {
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

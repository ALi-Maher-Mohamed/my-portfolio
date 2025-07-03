import 'package:Ali_Maher/core/constant/theme.dart';
import 'package:Ali_Maher/core/constant/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyProjectsWeb extends StatefulWidget {
  const MyProjectsWeb({super.key});

  @override
  State<MyProjectsWeb> createState() => _MyProjectsWebState();
}

class _MyProjectsWebState extends State<MyProjectsWeb> {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 1.0);

  final List<Map<String, String>> portfolioItems = [
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 1200;
    final isMediumScreen = screenWidth > 900 && screenWidth <= 1200;
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Container(
      color: isLightMode ? LightThemeColors.bgPrimary : CustomColors.scaffold2,
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
            _buildSectionHeader(screenWidth, isLightMode),
            SizedBox(height: _getSectionSpacing(screenWidth)),
            _buildProjectsSection(
                context, screenWidth, isLargeScreen, isMediumScreen),
            if (portfolioItems.length >
                (isLargeScreen
                    ? 3
                    : isMediumScreen
                        ? 2
                        : 1))
              _buildPageIndicators(screenWidth, isLightMode),
            _buildSeeMoreButton(context, screenWidth, isLightMode),
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

  Widget _buildSectionHeader(double screenWidth, bool isLightMode) {
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
                  color: isLightMode
                      ? LightThemeColors.primaryCyan
                      : Colors.cyanAccent,
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
              colors: isLightMode
                  ? [
                      LightThemeColors.primaryCyan,
                      LightThemeColors.primaryCyan.withOpacity(0.3),
                    ]
                  : [
                      Colors.cyanAccent,
                      Colors.cyanAccent.withOpacity(0.3),
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

  Widget _buildProjectsSection(BuildContext context, double screenWidth,
      bool isLargeScreen, bool isMediumScreen) {
    final crossAxisCount = isLargeScreen
        ? 3
        : isMediumScreen
            ? 2
            : 1;
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return SizedBox(
      height: _getCardHeight(screenWidth),
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: (portfolioItems.length / crossAxisCount).ceil(),
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, pageIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  crossAxisCount,
                  (index) {
                    final projectIndex = pageIndex * crossAxisCount + index;
                    if (projectIndex < portfolioItems.length) {
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: _getAxisSpacing(screenWidth),
                          ),
                          child: _buildPortfolioCard(
                              context, projectIndex, screenWidth),
                        ),
                      );
                    } else {
                      return Expanded(child: Container());
                    }
                  },
                ),
              )
                  .animate()
                  .fadeIn(
                    duration: const Duration(milliseconds: 600),
                  )
                  .slideY(
                    begin: 0.3,
                    end: 0.0,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 800),
                  );
            },
          ),
          if (portfolioItems.length > crossAxisCount) ...[
            if (_currentPage > 0)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: _HoverAnimatedButton(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_left,
                      size: 40,
                      color: isLightMode
                          ? LightThemeColors.primaryCyan
                          : Colors.cyanAccent,
                    ),
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ),
            if (_currentPage <
                (portfolioItems.length / crossAxisCount).ceil() - 1)
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: _HoverAnimatedButton(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_right,
                      size: 40,
                      color: isLightMode
                          ? LightThemeColors.primaryCyan
                          : Colors.cyanAccent,
                    ),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildPortfolioCard(
      BuildContext context, int index, double screenWidth) {
    final item = portfolioItems[index];
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return _HoverAnimatedPortfolioCard(
      index: index,
      child: Container(
        constraints: BoxConstraints(
          minHeight: _getCardHeight(screenWidth) * 0.8,
          maxHeight: _getCardHeight(screenWidth),
          minWidth: 260,
          maxWidth: 350,
        ),
        decoration: BoxDecoration(
          color: isLightMode
              ? LightThemeColors.bgCard
              : const Color(0xFF2C3E50).withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isLightMode
                ? LightThemeColors.borderLight
                : Colors.cyanAccent.withOpacity(0.2),
            width: 1,
          ),
          image: DecorationImage(
            image: AssetImage(item['image'] as String),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              isLightMode
                  ? Colors.black.withOpacity(0.4)
                  : Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
          boxShadow: isLightMode
              ? [
                  BoxShadow(
                    color: LightThemeColors.shadowLight,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.pushNamed(context, item['route'] as String);
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: isLightMode
                            ? [
                                Colors.transparent,
                                LightThemeColors.bgCard.withOpacity(0.9),
                              ]
                            : [
                                Colors.transparent,
                                const Color(0xFF2C3E50).withOpacity(0.9),
                              ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.all(_getSkillPadding(screenWidth)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: _getImageSize(screenWidth),
                          height: _getImageSize(screenWidth),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isLightMode
                                  ? LightThemeColors.borderMedium
                                  : Colors.white,
                              width: 2,
                            ),
                            color: isLightMode
                                ? LightThemeColors.bgPrimary
                                : Colors.white.withOpacity(0.1),
                          ),
                          child: Icon(
                            _getIconForIndex(index),
                            size: _getImageSize(screenWidth) * 0.6,
                            color: isLightMode
                                ? LightThemeColors.primaryCyan
                                : Colors.cyanAccent,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          item['title'] as String,
                          style: TextStyle(
                            fontSize: _getSkillFontSize(screenWidth) + 4,
                            fontWeight: FontWeight.w700,
                            color: isLightMode
                                ? LightThemeColors.textPrimary
                                : Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: isLightMode
                                ? LightThemeColors.bgSecondary
                                : Colors.cyanAccent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isLightMode
                                  ? LightThemeColors.borderLight
                                  : Colors.cyanAccent.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            item['category'] as String,
                            style: TextStyle(
                              fontSize: _getSkillFontSize(screenWidth) - 2,
                              color: isLightMode
                                  ? LightThemeColors.textSecondary
                                  : Colors.cyanAccent.withOpacity(0.8),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: _HoverAnimatedButton(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, item['route'] as String);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isLightMode
                                    ? LightThemeColors.primaryCyan
                                    : Colors.cyanAccent,
                                foregroundColor: isLightMode
                                    ? LightThemeColors.textOnPrimary
                                    : Colors.white,
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
                              child: const Text('View Project'),
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
      ),
    );
  }

  Widget _buildPageIndicators(double screenWidth, bool isLightMode) {
    final crossAxisCount = screenWidth > 1200
        ? 3
        : screenWidth > 900
            ? 2
            : 1;

    return Padding(
      padding: EdgeInsets.only(top: _getSectionSpacing(screenWidth)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          (portfolioItems.length / crossAxisCount).ceil(),
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: _currentPage == index ? 12 : 8,
            height: _currentPage == index ? 12 : 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == index
                  ? (isLightMode
                      ? LightThemeColors.primaryCyan
                      : Colors.cyanAccent)
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

  Widget _buildSeeMoreButton(
      BuildContext context, double screenWidth, bool isLightMode) {
    return Padding(
      padding: EdgeInsets.only(top: _getSectionSpacing(screenWidth)),
      child: _HoverAnimatedButton(
        child: ElevatedButton(
          onPressed: () {
            launchCustomUrl(context,
                url: 'https://github.com/ALi-Maher-Mohamed?tab=repositories');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isLightMode ? LightThemeColors.primaryCyan : Colors.cyanAccent,
            foregroundColor:
                isLightMode ? LightThemeColors.textOnPrimary : Colors.white,
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

  double _getCardHeight(double screenWidth) {
    if (screenWidth > 1200) return 450;
    if (screenWidth > 900) return 400;
    return 350;
  }

  double _getAxisSpacing(double screenWidth) {
    if (screenWidth > 1200) return 20;
    if (screenWidth > 900) return 15;
    return 10;
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

  double _getSkillPadding(double screenWidth) {
    if (screenWidth > 1200) return 16;
    if (screenWidth > 900) return 12;
    return 10;
  }

  IconData _getIconForIndex(int index) {
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

class _HoverAnimatedPortfolioCard extends StatefulWidget {
  final Widget child;
  final int index;

  const _HoverAnimatedPortfolioCard({
    required this.child,
    required this.index,
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

  const _HoverAnimatedButton({required this.child});

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

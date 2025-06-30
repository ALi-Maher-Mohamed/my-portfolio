import 'package:Ali_Maher/core/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyServicesWeb extends StatefulWidget {
  const MyServicesWeb({super.key, required this.onScrollToIndex});
  final void Function(int) onScrollToIndex;

  @override
  State<MyServicesWeb> createState() => _MyServicesWebState();
}

class _MyServicesWebState extends State<MyServicesWeb> {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 1.0);

  final List<Map<String, String>> services = [
    {
      'title': 'Software Engineering',
      'description':
          'As a software engineering student and developer, I apply clean code principles, version control (Git), and agile methodologies in my projects. I understand both frontend and backend logic, and I work effectively with REST APIs, local storage, and scalable app structures.',
    },
    {
      'title': 'Mobile App Development',
      'description':
          'I develop modern and efficient cross-platform mobile applications using Flutter and Dart. With over 10 apps built, ranging from creative personal ideas to real-world projects, I focus on clean architecture, state management (Cubit/BLoC), Firebase integration, and responsive UI/UX.',
    },
    {
      'title': 'Technical Instructor & Mentor',
      'description':
          'With real experience teaching at iSchool, GDSC, and GDG communities, I deliver engaging and practical sessions on programming fundamentals, Flutter development, and software concepts. I’ve trained students online and offline, helping beginners turn ideas into real projects.',
    },
    {
      'title': 'Sales & Digital Marketing',
      'description':
          'With over 5 years of sales experience, I understand how to connect with customers and communicate value clearly. I also have hands-on experience with digital marketing strategies and content creation for tech and educational campaigns.',
    },
    {
      'title': 'UI/UX Consulting',
      'description':
          'I help individuals and teams design better user experiences by analyzing UI flow, usability, accessibility, and consistency. I give actionable feedback based on UX principles, especially for mobile apps and web platforms.',
    },
    {
      'title': 'Mentorship for Beginners',
      'description':
          'I provide mentorship for beginners in programming, helping them set learning paths, solve bugs, understand core concepts, and build confidence through small, progressive tasks.',
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
            _buildServicesSection(
                context, screenWidth, isLargeScreen, isMediumScreen),
            if (services.length >
                (isLargeScreen
                    ? 3
                    : isMediumScreen
                        ? 2
                        : 1))
              _buildPageIndicators(screenWidth, isLightMode),
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
                text: "Services",
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

  Widget _buildServicesSection(BuildContext context, double screenWidth,
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
            itemCount: (services.length / crossAxisCount).ceil(),
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
                    final serviceIndex = pageIndex * crossAxisCount + index;
                    if (serviceIndex < services.length) {
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: _getAxisSpacing(screenWidth),
                          ),
                          child: _buildServiceCard(
                              context, serviceIndex, screenWidth),
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
          if (services.length > crossAxisCount) ...[
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
            if (_currentPage < (services.length / crossAxisCount).ceil() - 1)
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

  Widget _buildServiceCard(
      BuildContext context, int index, double screenWidth) {
    final service = services[index];
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return _HoverAnimatedServiceCard(
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
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(_getSkillPadding(screenWidth)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    service['title'] as String,
                    style: TextStyle(
                      fontSize: _getSkillFontSize(screenWidth) + 4,
                      fontWeight: FontWeight.w700,
                      color: isLightMode
                          ? LightThemeColors.textPrimary
                          : Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    service['description'] as String,
                    style: TextStyle(
                      fontSize: _getSkillFontSize(screenWidth) - 2,
                      color: isLightMode
                          ? LightThemeColors.textSecondary
                          : Colors.white.withOpacity(0.8),
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    child: _HoverAnimatedButton(
                      child: ElevatedButton(
                        onPressed: () {
                          widget.onScrollToIndex(5);
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
                        child: const Text('Hire Me'),
                      ),
                    ),
                  ),
                ],
              ),
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
          (services.length / crossAxisCount).ceil(),
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
}

class _HoverAnimatedServiceCard extends StatefulWidget {
  final Widget child;
  final int index;

  const _HoverAnimatedServiceCard({
    required this.child,
    required this.index,
  });

  @override
  State<_HoverAnimatedServiceCard> createState() =>
      _HoverAnimatedServiceCardState();
}

class _HoverAnimatedServiceCardState extends State<_HoverAnimatedServiceCard> {
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

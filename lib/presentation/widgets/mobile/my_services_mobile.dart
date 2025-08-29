import 'package:Ali_Maher/core/constant/theme.dart';
import 'package:Ali_Maher/presentation/widgets/shared_my_services.dart';
import 'package:Ali_Maher/presentation/widgets/shared_my_services.dart'
    as ResponsiveHelper;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyServicesMobile extends StatefulWidget {
  const MyServicesMobile({super.key, required this.onScrollToIndex});
  final void Function(int) onScrollToIndex;

  @override
  State<MyServicesMobile> createState() => _MyServicesMobileState();
}

class _MyServicesMobileState extends State<MyServicesMobile> {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 1.0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Container(
      color: isLightMode ? LightThemeColors.bgPrimary : CustomColors.scaffold2,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: getHorizontalPadding(screenWidth),
        vertical: getVerticalPadding(screenWidth),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSectionHeader(screenWidth, isLightMode),
          SizedBox(height: getSectionSpacing(screenWidth)),
          _buildServicesSection(context, screenWidth),
          if (services.length > 1)
            _buildPageIndicators(screenWidth, isLightMode),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(double screenWidth, bool isLightMode) {
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
                  fontSize: getTitleFontSize(screenWidth),
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
              TextSpan(
                text: "Services",
                style: TextStyle(
                  color:
                      isLightMode ? LightThemeColors.primaryCyan : Colors.cyan,
                  fontSize: getTitleFontSize(screenWidth),
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: getUnderlineWidth(screenWidth),
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

  Widget _buildServicesSection(BuildContext context, double screenWidth) {
    return SizedBox(
      height: getCardHeight(screenWidth),
      child: PageView.builder(
        controller: _pageController,
        itemCount: services.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getAxisSpacing(screenWidth),
            ),
            child: _buildServiceCard(context, index, screenWidth),
          );
        },
      ).animate().fadeIn(duration: const Duration(milliseconds: 600)).slideY(
            begin: 0.3,
            end: 0.0,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 800),
          ),
    );
  }

  Widget _buildServiceCard(
      BuildContext context, int index, double screenWidth) {
    final service = services[index];
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Container(
      constraints: BoxConstraints(
        minHeight: getCardHeight(screenWidth) * 0.8,
        maxHeight: getCardHeight(screenWidth),
        minWidth: 260,
        maxWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: isLightMode
            ? LightThemeColors.bgCard
            : const Color(0xFF2C3E50).withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isLightMode
              ? LightThemeColors.borderLight
              : Colors.cyan.withOpacity(0.2),
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
            padding: EdgeInsets.all(getSkillPadding(screenWidth)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  service['title'] as String,
                  style: TextStyle(
                    fontSize: getSkillFontSize(screenWidth) + 4,
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
                    fontSize: getSkillFontSize(screenWidth) - 2,
                    color: isLightMode
                        ? LightThemeColors.textSecondary
                        : Colors.white.withOpacity(0.8),
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onScrollToIndex(5);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isLightMode
                          ? LightThemeColors.primaryCyan
                          : Colors.cyan,
                      foregroundColor: isLightMode
                          ? LightThemeColors.textOnPrimary
                          : Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: getSkillPadding(screenWidth) * 2,
                        vertical: getSkillPadding(screenWidth),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: TextStyle(
                        fontSize: getSkillFontSize(screenWidth),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: const Text('Hire Me'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate(delay: Duration(milliseconds: 100 * index)).fadeIn(
          duration: const Duration(milliseconds: 400),
        );
  }

  Widget _buildPageIndicators(double screenWidth, bool isLightMode) {
    return Padding(
      padding:
          EdgeInsets.only(top: ResponsiveHelper.getSectionSpacing(screenWidth)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          services.length,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: _currentPage == index ? 24 : 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: _currentPage == index
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

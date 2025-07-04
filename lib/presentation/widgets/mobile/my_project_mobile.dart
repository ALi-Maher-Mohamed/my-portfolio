import 'package:Ali_Maher/core/constant/theme.dart';
import 'package:Ali_Maher/core/constant/launch_url.dart';
import 'package:Ali_Maher/presentation/widgets/shared_my_projects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyProjectsMobile extends StatefulWidget {
  const MyProjectsMobile({super.key});

  @override
  State<MyProjectsMobile> createState() => _MyProjectsMobileState();
}

class _MyProjectsMobileState extends State<MyProjectsMobile> {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 0.85);

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
        horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
        vertical: ResponsiveHelper.getVerticalPadding(screenWidth),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SectionHeader(
            screenWidth: screenWidth,
            isLightMode: isLightMode,
          ),
          SizedBox(height: ResponsiveHelper.getSectionSpacing(screenWidth)),
          _buildProjectsSection(context, screenWidth, isLightMode),
          _buildPageIndicators(screenWidth, isLightMode),
          _buildSeeMoreButton(context, screenWidth, isLightMode),
        ],
      ),
    );
  }

  Widget _buildProjectsSection(
      BuildContext context, double screenWidth, bool isLightMode) {
    return SizedBox(
      height: ResponsiveHelper.getCardHeight(screenWidth) + 40,
      child: PageView.builder(
        controller: _pageController,
        itemCount: portfolioItems.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.getAxisSpacing(screenWidth),
            ),
            child: _buildPortfolioCard(context, index, screenWidth),
          );
        },
      ),
    );
  }

  Widget _buildPortfolioCard(
      BuildContext context, int index, double screenWidth) {
    final item = portfolioItems[index];
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return AnimatedScale(
      scale: _currentPage == index ? 1.0 : 0.9,
      duration: const Duration(milliseconds: 300),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: isLightMode
              ? LightThemeColors.bgCard
              : const Color(0xFF2C3E50).withOpacity(0.8),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isLightMode
                ? LightThemeColors.borderLight
                : Colors.cyan.withOpacity(0.2),
            width: 2,
          ),
          image: DecorationImage(
            image: AssetImage(item['image'] as String),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              isLightMode
                  ? Colors.black.withOpacity(0.3)
                  : Colors.black.withOpacity(0.4),
              BlendMode.darken,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: isLightMode
                  ? LightThemeColors.shadowLight
                  : Colors.cyan.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              launchCustomUrl(context, url: item['route']);
            },
            child: Stack(
              children: [
                // تدرج الخلفية
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: isLightMode
                            ? [
                                Colors.transparent,
                                LightThemeColors.bgCard.withOpacity(0.95),
                              ]
                            : [
                                Colors.transparent,
                                const Color(0xFF2C3E50).withOpacity(0.95),
                              ],
                      ),
                    ),
                  ),
                ),
                // المحتوى
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.all(
                        ResponsiveHelper.getSkillPadding(screenWidth) * 1.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // الأيقونة
                        Container(
                          width:
                              ResponsiveHelper.getImageSize(screenWidth) * 1.5,
                          height:
                              ResponsiveHelper.getImageSize(screenWidth) * 1.5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isLightMode
                                  ? LightThemeColors.primaryCyan
                                  : Colors.cyan,
                              width: 3,
                            ),
                            color: isLightMode
                                ? LightThemeColors.bgPrimary
                                : Colors.white.withOpacity(0.1),
                          ),
                          child: Icon(
                            ResponsiveHelper.getIconForIndex(index),
                            size: ResponsiveHelper.getImageSize(screenWidth) *
                                0.8,
                            color: isLightMode
                                ? LightThemeColors.primaryCyan
                                : Colors.cyan,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // عنوان المشروع
                        Text(
                          item['title'] as String,
                          style: TextStyle(
                            fontSize:
                                ResponsiveHelper.getSkillFontSize(screenWidth) +
                                    8,
                            fontWeight: FontWeight.w800,
                            color: isLightMode
                                ? LightThemeColors.textPrimary
                                : Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        // فئة المشروع
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isLightMode
                                ? LightThemeColors.primaryCyan.withOpacity(0.1)
                                : Colors.cyan.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isLightMode
                                  ? LightThemeColors.primaryCyan
                                      .withOpacity(0.3)
                                  : Colors.cyan.withOpacity(0.3),
                              width: 1.5,
                            ),
                          ),
                          child: Text(
                            item['category'] as String,
                            style: TextStyle(
                              fontSize: ResponsiveHelper.getSkillFontSize(
                                      screenWidth) +
                                  2,
                              fontWeight: FontWeight.w600,
                              color: isLightMode
                                  ? LightThemeColors.primaryCyan
                                  : Colors.cyan,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // زر عرض المشروع
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, item['route'] as String);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isLightMode
                                  ? LightThemeColors.primaryCyan
                                  : Colors.cyan,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: ResponsiveHelper.getSkillPadding(
                                        screenWidth) *
                                    2,
                                vertical: ResponsiveHelper.getSkillPadding(
                                        screenWidth) *
                                    1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              elevation: 5,
                              textStyle: TextStyle(
                                fontSize: ResponsiveHelper.getSkillFontSize(
                                        screenWidth) +
                                    4,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('View Project'),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward, size: 18),
                              ],
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
      )
          .animate(delay: Duration(milliseconds: 100 * index))
          .fadeIn(duration: const Duration(milliseconds: 600))
          .slideY(begin: 0.3, end: 0.0, curve: Curves.easeOut),
    );
  }

  Widget _buildPageIndicators(double screenWidth, bool isLightMode) {
    return Padding(
      padding:
          EdgeInsets.only(top: ResponsiveHelper.getSectionSpacing(screenWidth)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          portfolioItems.length,
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

  Widget _buildSeeMoreButton(
      BuildContext context, double screenWidth, bool isLightMode) {
    return Padding(
      padding:
          EdgeInsets.only(top: ResponsiveHelper.getSectionSpacing(screenWidth)),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            launchCustomUrl(context,
                url: 'https://github.com/ALi-Maher-Mohamed?tab=repositories');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isLightMode ? LightThemeColors.primaryCyan : Colors.cyan,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.getSkillPadding(screenWidth) * 2,
              vertical: ResponsiveHelper.getSkillPadding(screenWidth) * 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 8,
            textStyle: TextStyle(
              fontSize: ResponsiveHelper.getSkillFontSize(screenWidth) + 4,
              fontWeight: FontWeight.w700,
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('See More Projects'),
              SizedBox(width: 12),
              Icon(Icons.open_in_new, size: 20),
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
}

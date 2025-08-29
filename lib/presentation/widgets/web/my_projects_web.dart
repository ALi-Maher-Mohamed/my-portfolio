import 'package:Ali_Maher/core/constant/theme.dart';
import 'package:Ali_Maher/core/constant/launch_url.dart';
import 'package:Ali_Maher/presentation/widgets/shared_my_projects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:supabase_flutter/supabase_flutter.dart'; // تأكد من إضافة هذا الـ import

class MyProjectsWeb extends StatefulWidget {
  const MyProjectsWeb({super.key});

  @override
  State<MyProjectsWeb> createState() => _MyProjectsWebState();
}

class _MyProjectsWebState extends State<MyProjectsWeb> {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 1.0);

  // متغيرات جديدة لحالة البيانات
  List<Map<String, dynamic>> projects = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchProjects();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // فانشكن جلب البيانات من Supabase
  Future<void> _fetchProjects() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      final response = await Supabase.instance.client.from('projects').select();

      setState(() {
        projects = List<Map<String, dynamic>>.from(response);
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = 'خطأ في تحميل المشاريع: ${error.toString()}';
        isLoading = false;
      });
    }
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
        horizontal: ResponsiveHelper.getHorizontalPadding(screenWidth),
        vertical: ResponsiveHelper.getVerticalPadding(screenWidth),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SectionHeader(
              screenWidth: screenWidth,
              isLightMode: isLightMode,
            ),
            SizedBox(height: ResponsiveHelper.getSectionSpacing(screenWidth)),

            // عرض حالة التحميل أو الخطأ أو المحتوى
            if (isLoading)
              _buildLoadingWidget(screenWidth)
            else if (errorMessage != null)
              _buildErrorWidget(screenWidth, isLightMode)
            else if (projects.isEmpty)
              _buildEmptyWidget(screenWidth, isLightMode)
            else ...[
              _buildProjectsSection(
                  context, screenWidth, isLargeScreen, isMediumScreen),
              if (projects.length >
                  (isLargeScreen
                      ? 3
                      : isMediumScreen
                          ? 2
                          : 1))
                PageIndicators(
                  screenWidth: screenWidth,
                  isLightMode: isLightMode,
                  currentPage: _currentPage,
                  crossAxisCount: isLargeScreen
                      ? 3
                      : isMediumScreen
                          ? 2
                          : 1,
                ),
              _buildSeeMoreButton(context, screenWidth, isLightMode),
            ],
          ],
        ),
      ),
    );
  }

  // ويدجت التحميل
  Widget _buildLoadingWidget(double screenWidth) {
    return SizedBox(
      height: ResponsiveHelper.getCardHeight(screenWidth),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.cyan),
            SizedBox(height: 16),
            Text(
              'جاري تحميل المشاريع...',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // ويدجت عرض الخطأ
  Widget _buildErrorWidget(double screenWidth, bool isLightMode) {
    return SizedBox(
      height: ResponsiveHelper.getCardHeight(screenWidth),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              errorMessage!,
              style: TextStyle(
                fontSize: 16,
                color: isLightMode ? Colors.red : Colors.red[300],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchProjects,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.white,
              ),
              child: const Text('إعادة المحاولة'),
            ),
          ],
        ),
      ),
    );
  }

  // ويدجت عندما لا توجد مشاريع
  Widget _buildEmptyWidget(double screenWidth, bool isLightMode) {
    return SizedBox(
      height: ResponsiveHelper.getCardHeight(screenWidth),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.folder_open,
              size: 48,
              color: isLightMode ? Colors.grey[600] : Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'لا توجد مشاريع متاحة حالياً',
              style: TextStyle(
                fontSize: 16,
                color: isLightMode ? Colors.grey[600] : Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
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
      height: ResponsiveHelper.getCardHeight(screenWidth),
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: (projects.length / crossAxisCount).ceil(),
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
                    if (projectIndex < projects.length) {
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                ResponsiveHelper.getAxisSpacing(screenWidth),
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
          // أزرار التنقل للويب
          if (projects.length > crossAxisCount) ...[
            if (_currentPage > 0)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: HoverAnimatedButton(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_left,
                      size: 40,
                      color: isLightMode
                          ? LightThemeColors.primaryCyan
                          : Colors.cyan,
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
            if (_currentPage < (projects.length / crossAxisCount).ceil() - 1)
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: HoverAnimatedButton(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_right,
                      size: 40,
                      color: isLightMode
                          ? LightThemeColors.primaryCyan
                          : Colors.cyan,
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
    final item = projects[index]; // استخدام البيانات من Supabase
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return HoverAnimatedPortfolioCard(
      index: index,
      child: Container(
        constraints: BoxConstraints(
          minHeight: ResponsiveHelper.getCardHeight(screenWidth) * 0.8,
          maxHeight: ResponsiveHelper.getCardHeight(screenWidth),
          minWidth: 260,
          maxWidth: 400,
        ),
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
          image: item['image_url'] != null
              ? DecorationImage(
                  image: NetworkImage(
                    item['image_url'] as String,
                  ), // استخدام NetworkImage للصور من Supabase
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    isLightMode
                        ? Colors.black.withOpacity(0.3)
                        : Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: isLightMode
                  ? LightThemeColors.shadowLight
                  : Colors.cyan.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              if (item['route'] != null) {
                launchCustomUrl(context, url: item['route']);
              }
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
                              ResponsiveHelper.getImageSize(screenWidth) * 1.2,
                          height:
                              ResponsiveHelper.getImageSize(screenWidth) * 1.2,
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
                            _getIconFromString(item['icon']) ??
                                ResponsiveHelper.getIconForIndex(index),
                            size: ResponsiveHelper.getImageSize(screenWidth) *
                                0.7,
                            color: isLightMode
                                ? LightThemeColors.primaryCyan
                                : Colors.cyan,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // عنوان المشروع
                        Text(
                          item['title']?.toString() ?? 'مشروع بدون عنوان',
                          style: TextStyle(
                            fontSize:
                                ResponsiveHelper.getSkillFontSize(screenWidth) +
                                    6,
                            fontWeight: FontWeight.w800,
                            color: isLightMode
                                ? LightThemeColors.textPrimary
                                : Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
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
                            item['category']?.toString() ?? 'غير محدد',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.getSkillFontSize(
                                  screenWidth),
                              fontWeight: FontWeight.w600,
                              color: isLightMode
                                  ? LightThemeColors.primaryCyan
                                  : Colors.cyan,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // زر عرض المشروع
                        SizedBox(
                          width: double.infinity,
                          child: HoverAnimatedButton(
                            child: ElevatedButton(
                              onPressed: () {
                                if (item['route'] != null) {
                                  Navigator.pushNamed(
                                      context, item['route'] as String);
                                }
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
                                      1.2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 5,
                                textStyle: TextStyle(
                                  fontSize: ResponsiveHelper.getSkillFontSize(
                                          screenWidth) +
                                      2,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('View Project'),
                                  SizedBox(width: 8),
                                  Icon(Icons.arrow_forward, size: 16),
                                ],
                              ),
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

  // فانشكن لتحويل نص الأيقونة إلى IconData
  IconData? _getIconFromString(String? iconString) {
    if (iconString == null) return null;

    switch (iconString.toLowerCase()) {
      case 'web':
      case 'website':
        return Icons.web;
      case 'mobile':
      case 'phone':
        return Icons.phone_android;
      case 'desktop':
      case 'computer':
        return Icons.desktop_windows;
      case 'code':
        return Icons.code;
      case 'design':
        return Icons.design_services;
      case 'api':
        return Icons.api;
      default:
        return Icons.folder;
    }
  }

  Widget _buildSeeMoreButton(
      BuildContext context, double screenWidth, bool isLightMode) {
    return Padding(
      padding:
          EdgeInsets.only(top: ResponsiveHelper.getSectionSpacing(screenWidth)),
      child: HoverAnimatedButton(
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
              horizontal: ResponsiveHelper.getSkillPadding(screenWidth) * 3,
              vertical: ResponsiveHelper.getSkillPadding(screenWidth) * 1.2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 8,
            textStyle: TextStyle(
              fontSize: ResponsiveHelper.getSkillFontSize(screenWidth) + 2,
              fontWeight: FontWeight.w700,
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
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

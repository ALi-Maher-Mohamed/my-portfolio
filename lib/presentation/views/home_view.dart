import 'package:Ali_Maher/presentation/widgets/mobile/about_me_mobile.dart';
import 'package:Ali_Maher/presentation/widgets/mobile/main_mobile.dart';
import 'package:Ali_Maher/presentation/widgets/mobile/my_project_mobile.dart';
import 'package:Ali_Maher/presentation/widgets/mobile/my_services_mobile.dart';
import 'package:flutter/material.dart';
import 'package:Ali_Maher/core/constant/theme.dart';
import 'package:Ali_Maher/core/constant/size.dart';
import 'package:Ali_Maher/presentation/widgets/web/about_me_web.dart';
import 'package:Ali_Maher/presentation/widgets/web/contact_me_web.dart';
import 'package:Ali_Maher/presentation/widgets/mobile/mobile_drawer.dart';
import 'package:Ali_Maher/presentation/widgets/mobile/mobile_header.dart';
import 'package:Ali_Maher/presentation/widgets/web/my_service_web.dart';
import 'package:Ali_Maher/presentation/widgets/web/my_skills_web.dart';
import 'package:Ali_Maher/presentation/widgets/web/my_projects_web.dart';
import 'package:Ali_Maher/presentation/widgets/web/web_header.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../widgets/web/main_web.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late AutoScrollController _scrollController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _scrollController = AutoScrollController();
  }

  Future<void> scrollToIndex(int index) async {
    await _scrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
    );

    // بعدها نستخدم animateTo علشان نعمل Smooth Scroll manually
    await _scrollController.animateTo(
      _scrollController.position.pixels,
      duration: Duration(seconds: 2),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        endDrawer: constraints.maxWidth >= kMinDisktpWidth
            ? null
            : MobileDrawer(
                onScrollToIndex: scrollToIndex,
                isDarkMode: widget.isDarkMode,
                onThemeToggle: widget.onThemeChanged,
              ),
        body: ListView(
          controller: _scrollController,
          children: [
            AutoScrollTag(
              key: ValueKey(0),
              controller: _scrollController,
              index: 0,
              child: Container(
                height: screenHeight,
                width: double.infinity,
                color: isLightMode
                    ? LightThemeColors.bgPrimary
                    : CustomColors.scaffold2,
                child: Stack(children: [
                  SizedBox(
                    height: screenHeight,
                    width: screenWidth,
                    child: Opacity(
                      opacity: 0.2,
                      child: Image.asset(
                        'assets/MyPhoto/image.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      if (constraints.maxWidth >= kMinDisktpWidth) ...[
                        WebHeader(
                            isDarkMode: widget.isDarkMode,
                            onThemeToggle: widget.onThemeChanged,
                            onNavItemTap: scrollToIndex),
                        MainWeb(
                          onScrollToIndex: scrollToIndex,
                          screenSize: screenSize,
                          // screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        ),
                      ] else ...[
                        MobileHeader(
                          onLogoTap: () {},
                          onMenuTap: () {
                            scaffoldKey.currentState?.openEndDrawer();
                          },
                        ),
                        MainMobile(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                        ),
                      ],
                    ],
                  ),
                ]),
              ),
            ),
            AutoScrollTag(
                key: ValueKey(1),
                controller: _scrollController,
                index: 1,
                child: constraints.maxWidth >= kMinDisktpWidth
                    ? AboutMeSectionWeb()
                    : AboutMeMobile()),
            AutoScrollTag(
              key: ValueKey(2),
              controller: _scrollController,
              index: 2,
              child: SkillsSectionWeb(),
            ),
            AutoScrollTag(
              key: ValueKey(3),
              controller: _scrollController,
              index: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isLightMode
                      ? LightThemeColors.bgPrimary
                      : CustomColors.scaffold2,
                ),
                child: constraints.maxWidth >= kMinDisktpWidth
                    ? MyServicesWeb(
                        onScrollToIndex: scrollToIndex,
                      )
                    : MyServicesMobile(
                        onScrollToIndex: scrollToIndex,
                      ),
              ),
            ),
            AutoScrollTag(
              key: ValueKey(4),
              controller: _scrollController,
              index: 4,
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isLightMode
                        ? LightThemeColors.bgPrimary
                        : CustomColors.scaffold2,
                  ),
                  child: MediaQuery.of(context).size.width > 600
                      ? MyProjectsWeb()
                      : MyProjectsMobile()),
            ),
            AutoScrollTag(
              key: ValueKey(5),
              controller: _scrollController,
              index: 5,
              child: Container(
                height: screenHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isLightMode
                      ? LightThemeColors.bgPrimary
                      : CustomColors.scaffold2,
                ),
                child: ContactMePage(),
              ),
            ),
          ],
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:Ali_Maher/core/constant/colors.dart';
import 'package:Ali_Maher/core/constant/size.dart';
import 'package:Ali_Maher/presentation/widgets/about_me_web.dart';
import 'package:Ali_Maher/presentation/widgets/contact_me_web.dart';
import 'package:Ali_Maher/presentation/widgets/mobile_drawer.dart';
import 'package:Ali_Maher/presentation/widgets/mobile_header.dart';
import 'package:Ali_Maher/presentation/widgets/my_service_web.dart';
import 'package:Ali_Maher/presentation/widgets/my_skills_web.dart';
import 'package:Ali_Maher/presentation/widgets/my_projects_web.dart';
import 'package:Ali_Maher/presentation/widgets/web_header.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../widgets/main_desktop.dart';
import '../widgets/main_mobile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

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
      duration: Duration(seconds: 2), // زوّد الوقت لو حابب أبطأ
      curve: Curves.easeInOutCubic, // منحنى الحركة (smooth جدا)
    );
  }

  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        endDrawer:
            constraints.maxWidth >= kMinDisktpWidth ? null : MobileDrawer(),
        body: ListView(
          controller: _scrollController,
          children: [
            AutoScrollTag(
              key: ValueKey(0),
              controller: _scrollController,
              index: 0,
              child: SizedBox(
                height: screenHeight,
                width: double.infinity,
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
                        WebHeader(onNavItemTap: scrollToIndex),
                        MainDesktop(
                          onScrollToIndex: scrollToIndex,
                          screenSize: screenSize,
                          screenWidth: screenWidth,
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
              child: AboutMeSection(),
            ),
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
                decoration: BoxDecoration(color: CustomColors.scaffold2),
                child: MyServicesWeb(),
              ),
            ),
            AutoScrollTag(
              key: ValueKey(4),
              controller: _scrollController,
              index: 4,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: CustomColors.scaffold2),
                child: MyProjectsWeb(),
              ),
            ),
            AutoScrollTag(
              key: ValueKey(5),
              controller: _scrollController,
              index: 5,
              child: Container(
                height: screenHeight,
                width: double.infinity,
                decoration: BoxDecoration(color: CustomColors.scaffold2),
                child: ContactMePage(),
              ),
            ),
          ],
        ),
      );
    });
  }
}

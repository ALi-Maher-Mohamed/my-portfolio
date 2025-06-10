import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/constant/colors.dart';
import 'package:my_portfolio/constant/size.dart';
import 'package:my_portfolio/widgets/about_me_web.dart';
import 'package:my_portfolio/widgets/mobile_drawer.dart';
import 'package:my_portfolio/widgets/mobile_header.dart';
import 'package:my_portfolio/widgets/web_header.dart';

import '../widgets/main_desktop.dart';
import '../widgets/main_mobile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        endDrawer:
            constraints.maxWidth >= kMinDisktpWidth ? null : MobileDrawer(),
        body: ListView(children: [
          //main
          SizedBox(
            height: screenHeight,
            width: double.infinity,
            // decoration: BoxDecoration(color: CustomColors.scaffold1),
            child: Stack(children: [
              SizedBox(
                height: screenHeight,
                width: screenWidth,
                child: Opacity(
                  opacity: 0.2, // خفف الصورة (من 0.0 إلى 1.0)
                  child: Image.asset(
                    'assets/MyPhoto/image.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                children: [
                  if (constraints.maxWidth >= kMinDisktpWidth)
                    WebHeader()
                  else
                    MobileHeader(
                      onLogoTap: () {},
                      onMenuTap: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                    ),
                  if (constraints.maxWidth >= kMinDisktpWidth)
                    MainDesktop(
                      screenSize: screenSize,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    )
                  else
                    MainMobile(
                        screenHeight: screenHeight, screenWidth: screenWidth)
                ],
              ),
            ]),
          ),
          Container(
            width: screenWidth,
            decoration: BoxDecoration(color: CustomColors.scaffold2),
            child: AboutMeSection(),
          ),
          //project
          SkillsSection(),
          //skills
          Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(color: CustomColors.scaffold2),
          ),
        ]),
      );
    });
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  Widget buildSkill({
    required String imagePath,
    required String skillName,
    required double level,
    required int index,
  }) {
    return _HoverAnimatedSkill(
      index: index,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skillName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Stack(
                    children: [
                      Container(
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: level / 100,
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.cyanAccent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${level.toInt()}%',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<List<dynamic>> skillsData = [
      ['assets/icons/flutter.png', 'Flutter', 85.0],
      ['assets/icons/dart.png', 'Dart', 80.0],
      ['assets/icons/firebase.png', 'Firebase', 70.0],
      ['assets/icons/icons8-git-48.png', 'Git', 75.0],
      ['assets/icons/figma.png', 'Figma', 90.0],
      ['assets/icons/photoshop.png', 'Adobe Photoshop', 65.0],
      ['assets/icons/illustrator.png', 'Adobe Illustrator', 70.0],
      ['assets/icons/icons8-html-48.png', 'HTML - 5', 90.0],
    ];

    return Container(
      width: double.infinity,
      color: const Color(0xFF1F1F28),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'My Skills',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 30),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 700) {
                final half = (skillsData.length / 2).ceil();
                final firstHalf = skillsData.sublist(0, half);
                final secondHalf = skillsData.sublist(half);

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(firstHalf.length, (index) {
                        final data = firstHalf[index];
                        return buildSkill(
                          imagePath: data[0],
                          skillName: data[1],
                          level: data[2],
                          index: index,
                        );
                      }),
                    ),
                    const SizedBox(width: 60),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(secondHalf.length, (index) {
                        final data = secondHalf[index];
                        return buildSkill(
                          imagePath: data[0],
                          skillName: data[1],
                          level: data[2],
                          index: index + half,
                        );
                      }),
                    ),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(skillsData.length, (index) {
                    final data = skillsData[index];
                    return buildSkill(
                      imagePath: data[0],
                      skillName: data[1],
                      level: data[2],
                      index: index,
                    );
                  }),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _HoverAnimatedSkill extends StatefulWidget {
  final Widget child;
  final int index;

  const _HoverAnimatedSkill(
      {required this.child, required this.index, Key? key})
      : super(key: key);

  @override
  State<_HoverAnimatedSkill> createState() => _HoverAnimatedSkillState();
}

class _HoverAnimatedSkillState extends State<_HoverAnimatedSkill> {
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

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 450),
              child: Wrap(
                spacing: screenHeight / 60,
                runSpacing: screenHeight / 60,
                children: [
                  for (int i = 0; i < 4; i++)
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                          color: CustomColors.scaffold1,
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: Icon(
                          Icons.code,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Mobile Development',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          SizedBox(width: 50),
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 500,
              ),
              child: Wrap(
                spacing: screenHeight / 100,
                runSpacing: screenHeight / 100,
                children: [
                  for (int i = 0; i < 10; i++)
                    Chip(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      label: Text('data'),
                      avatar: Icon(Icons.code),
                    )
                ],
              ),
            ),
          )
        ]);
  }
}

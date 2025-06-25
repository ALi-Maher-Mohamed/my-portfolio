// ignore_for_file: deprecated_member_use

import 'package:Ali_Maher/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillsSectionWeb extends StatelessWidget {
  const SkillsSectionWeb({super.key});

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
        constraints: BoxConstraints(maxWidth: 1400),
        child: Column(
          children: [
            _buildSectionHeader(screenWidth),
            SizedBox(height: _getSectionSpacing(screenWidth)),
            _buildMainContent(screenWidth, isLargeScreen, isMediumScreen),
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
                text: "Skills",
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
        SizedBox(height: 16),
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

  Widget _buildMainContent(
      double screenWidth, bool isLargeScreen, bool isMediumScreen) {
    final skillsData = [
      ['assets/icons/flutter.png', 'Flutter', 85.0],
      ['assets/icons/dart.png', 'Dart', 90.0],
      ['assets/icons/firebase.png', 'Firebase', 70.0],
      ['assets/icons/icons8-git-48.png', 'Git', 85.0],
      ['assets/icons/figma.png', 'Figma', 90.0],
      ['assets/icons/python.png', 'Python', 90.0],
      ['assets/icons/c-.png', 'C++', 80.0],
      ['assets/icons/php.png', 'PHP', 60.0],
      ['assets/icons/hierarchy_structure.png', 'Data Structure', 80.0],
      ['assets/icons/programming.png', 'OOP', 80.0],
    ];

    return SingleChildScrollView(
      child: isLargeScreen
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: List.generate(
                      (skillsData.length / 2).ceil(),
                      (index) => _buildSkill(
                        imagePath: skillsData[index][0] as String,
                        skillName: skillsData[index][1] as String,
                        level: skillsData[index][2] as double,
                        index: index,
                        screenWidth: screenWidth,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: _getContentSpacing(screenWidth)),
                Expanded(
                  child: Column(
                    children: List.generate(
                      skillsData.length - (skillsData.length / 2).ceil(),
                      (index) => _buildSkill(
                        imagePath:
                            skillsData[index + (skillsData.length / 2).ceil()]
                                [0] as String,
                        skillName:
                            skillsData[index + (skillsData.length / 2).ceil()]
                                [1] as String,
                        level:
                            skillsData[index + (skillsData.length / 2).ceil()]
                                [2] as double,
                        index: index + (skillsData.length / 2).ceil(),
                        screenWidth: screenWidth,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: List.generate(
                skillsData.length,
                (index) => _buildSkill(
                  imagePath: skillsData[index][0] as String,
                  skillName: skillsData[index][1] as String,
                  level: skillsData[index][2] as double,
                  index: index,
                  screenWidth: screenWidth,
                ),
              ),
            ),
    );
  }

  double _getContentSpacing(double screenWidth) {
    if (screenWidth > 1400) return 120;
    if (screenWidth > 1200) return 100;
    if (screenWidth > 900) return 80;
    return 60;
  }

  Widget _buildSkill({
    required String imagePath,
    required String skillName,
    required double level,
    required int index,
    required double screenWidth,
  }) {
    final skillWidth = _getSkillWidth(screenWidth);
    final imageSize = _getImageSize(screenWidth);
    final fontSize = _getSkillFontSize(screenWidth);

    return _HoverAnimatedSkill(
      index: index,
      child: Container(
        width: skillWidth,
        padding: EdgeInsets.symmetric(vertical: _getSkillPadding(screenWidth)),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xFF2C3E50).withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.cyanAccent.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: _getSkillPadding(screenWidth)),
            Container(
              width: imageSize,
              height: imageSize,
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
            SizedBox(width: _getSkillPadding(screenWidth)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skillName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: fontSize,
                    ),
                  ),
                  SizedBox(height: 6),
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
            SizedBox(width: _getSkillPadding(screenWidth)),
            Text(
              '${level.toInt()}%',
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
              ),
            ),
            SizedBox(width: _getSkillPadding(screenWidth)),
          ],
        ),
      ),
    );
  }

  double _getSkillWidth(double screenWidth) {
    if (screenWidth > 1400) return 500;
    if (screenWidth > 1200) return 450;
    if (screenWidth > 900) return 400;
    return double.infinity;
  }

  double _getImageSize(double screenWidth) {
    if (screenWidth > 1200) return 50;
    if (screenWidth > 900) return 45;
    return 40;
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

class _HoverAnimatedSkill extends StatefulWidget {
  final Widget child;
  final int index;

  const _HoverAnimatedSkill({
    required this.child,
    required this.index,
  });

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

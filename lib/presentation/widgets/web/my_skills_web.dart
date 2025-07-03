import 'package:Ali_Maher/core/constant/theme.dart';
import 'package:Ali_Maher/presentation/widgets/shared_skills_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillsSectionWeb extends StatelessWidget {
  const SkillsSectionWeb({super.key});

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
        horizontal: getHorizontalPadding(screenWidth),
        vertical: getVerticalPadding(screenWidth),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1400),
        child: Column(
          children: [
            _buildSectionHeader(screenWidth, isLightMode),
            SizedBox(height: getSectionSpacing(screenWidth)),
            _buildMainContent(
                context, screenWidth, isLargeScreen, isMediumScreen),
          ],
        ),
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
                text: "Skills",
                style: TextStyle(
                  color: isLightMode
                      ? LightThemeColors.primaryCyan
                      : Colors.cyanAccent,
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

  Widget _buildMainContent(BuildContext context, double screenWidth,
      bool isLargeScreen, bool isMediumScreen) {
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
                        context: context,
                        imagePath: skillsData[index][0] as String,
                        skillName: skillsData[index][1] as String,
                        level: skillsData[index][2] as double,
                        index: index,
                        screenWidth: screenWidth,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: getContentSpacing(screenWidth)),
                Expanded(
                  child: Column(
                    children: List.generate(
                      skillsData.length - (skillsData.length / 2).ceil(),
                      (index) => _buildSkill(
                        context: context,
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
                  context: context,
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

  Widget _buildSkill({
    required String imagePath,
    required String skillName,
    required double level,
    required BuildContext context,
    required int index,
    required double screenWidth,
  }) {
    final skillWidth = getSkillWidth(screenWidth);
    final imageSize = getImageSize(screenWidth);
    final fontSize = getSkillFontSize(screenWidth);
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return _HoverAnimatedSkill(
      index: index,
      child: Container(
        width: skillWidth,
        padding: EdgeInsets.symmetric(vertical: getSkillPadding(screenWidth)),
        margin: const EdgeInsets.symmetric(vertical: 8),
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
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: getSkillPadding(screenWidth)),
            Container(
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isLightMode
                      ? LightThemeColors.borderMedium
                      : Colors.white,
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: getSkillPadding(screenWidth)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skillName,
                    style: TextStyle(
                      color: isLightMode
                          ? LightThemeColors.textPrimary
                          : Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: fontSize,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Stack(
                    children: [
                      Container(
                        height: 10,
                        decoration: BoxDecoration(
                          color: isLightMode
                              ? LightThemeColors.borderLight
                              : Colors.grey[800],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: level / 100,
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: isLightMode
                                ? LightThemeColors.primaryCyan
                                : Colors.cyanAccent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: getSkillPadding(screenWidth)),
            Text(
              '${level.toInt()}%',
              style: TextStyle(
                color:
                    isLightMode ? LightThemeColors.textSecondary : Colors.white,
                fontSize: fontSize,
              ),
            ),
            SizedBox(width: getSkillPadding(screenWidth)),
          ],
        ),
      ),
    );
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

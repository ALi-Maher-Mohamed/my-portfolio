import 'package:Ali_Maher/core/constant/theme.dart';
import 'package:Ali_Maher/presentation/widgets/shared_skills_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillsSectionMobile extends StatelessWidget {
  const SkillsSectionMobile({super.key});

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
        children: [
          _buildSectionHeader(screenWidth, isLightMode),
          SizedBox(height: getSectionSpacing(screenWidth)),
          _buildMainContent(context, screenWidth),
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
                  fontSize: getTitleFontSize(screenWidth) * 0.8,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
              TextSpan(
                text: "Skills",
                style: TextStyle(
                  color:
                      isLightMode ? LightThemeColors.primaryCyan : Colors.cyan,
                  fontSize: getTitleFontSize(screenWidth) * 0.8,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: getUnderlineWidth(screenWidth) * 0.8,
          height: 3,
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

  Widget _buildMainContent(BuildContext context, double screenWidth) {
    return Column(
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
    final imageSize = getImageSize(screenWidth) * 0.9;
    final fontSize = getSkillFontSize(screenWidth) * 0.9;
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: getSkillPadding(screenWidth)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: isLightMode
            ? LightThemeColors.bgCard
            : const Color(0xFF2C3E50).withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isLightMode
              ? LightThemeColors.borderLight
              : Colors.cyan.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: isLightMode
            ? [
                BoxShadow(
                  color: LightThemeColors.shadowLight.withOpacity(0.5),
                  blurRadius: 6,
                  offset: const Offset(0, 1),
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
                color:
                    isLightMode ? LightThemeColors.borderMedium : Colors.white,
                width: 1.5,
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
                const SizedBox(height: 4),
                Stack(
                  children: [
                    Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: isLightMode
                            ? LightThemeColors.borderLight
                            : Colors.grey[800],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: level / 100,
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: isLightMode
                              ? LightThemeColors.primaryCyan
                              : Colors.cyan,
                          borderRadius: BorderRadius.circular(4),
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
    )
        .animate(delay: Duration(milliseconds: 100 * index))
        .fadeIn(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        )
        .slideY(
          begin: 0.3,
          end: 0.0,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 600),
        );
  }
}

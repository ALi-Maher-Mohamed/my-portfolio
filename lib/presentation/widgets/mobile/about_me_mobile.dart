// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:Ali_Maher/core/constant/theme.dart';

class AboutMeMobile extends StatelessWidget {
  const AboutMeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Container(
      color: isLightMode ? LightThemeColors.bgPrimary : CustomColors.scaffold2,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: _getHorizontalPadding(screenWidth),
        vertical: _getVerticalPadding(screenWidth),
      ),
      child: Column(
        children: [
          _buildSectionHeader(screenWidth, isLightMode),
          SizedBox(height: _getSectionSpacing(screenWidth)),
          _buildInfoTabs(screenWidth, context),
        ],
      ),
    );
  }

  double _getHorizontalPadding(double screenWidth) {
    if (screenWidth > 600) return 24; // Tablet
    return 16; // Mobile
  }

  double _getVerticalPadding(double screenWidth) {
    if (screenWidth > 600) return 40; // Tablet
    return 32; // Mobile
  }

  double _getSectionSpacing(double screenWidth) {
    if (screenWidth > 600) return 32; // Tablet
    return 24; // Mobile
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
                text: "About ",
                style: TextStyle(
                  color:
                      isLightMode ? LightThemeColors.textPrimary : Colors.white,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
              ),
              TextSpan(
                text: "Me",
                style: TextStyle(
                  color: isLightMode
                      ? LightThemeColors.primaryCyan
                      : Colors.cyanAccent,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Container(
          width: _getUnderlineWidth(screenWidth),
          height: 3,
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
    );
  }

  double _getTitleFontSize(double screenWidth) {
    if (screenWidth > 600) return 36; // Tablet
    return 28; // Mobile
  }

  double _getUnderlineWidth(double screenWidth) {
    if (screenWidth > 600) return 80; // Tablet
    return 60; // Mobile
  }

  Widget _buildInfoTabs(double screenWidth, BuildContext context) {
    final tabHeight = _getTabHeight(screenWidth);
    final tabFontSize = _getTabFontSize(screenWidth);
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: isLightMode
                  ? LightThemeColors.bgSecondary
                  : Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isLightMode
                    ? LightThemeColors.borderLight
                    : Colors.cyanAccent.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: TabBar(
              isScrollable: false,
              indicatorPadding:
                  EdgeInsets.symmetric(horizontal: -10, vertical: 4),
              indicator: BoxDecoration(
                color: isLightMode
                    ? LightThemeColors.primaryCyan.withOpacity(0.2)
                    : Colors.cyanAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              labelColor:
                  isLightMode ? LightThemeColors.textPrimary : Colors.white,
              unselectedLabelColor:
                  isLightMode ? LightThemeColors.textMuted : Colors.white60,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: tabFontSize,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: tabFontSize,
              ),
              labelPadding: EdgeInsets.symmetric(
                  horizontal: _getTabPadding(screenWidth) - 5),
              tabs: [
                Tab(text: "Education"),
                Tab(text: "Courses"),
                Tab(text: "Experience"),
                Tab(text: "Skills"),
              ],
            ),
          ),
          SizedBox(height: 24),
          SizedBox(
            height: tabHeight,
            child: TabBarView(
              children: [
                _buildEducationTab(screenWidth, context),
                _buildCoursesTab(screenWidth, context),
                _buildExperienceTab(screenWidth, context),
                _buildSkillsTab(screenWidth, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _getTabHeight(double screenWidth) {
    if (screenWidth > 600) return 400; // Tablet
    return 350; // Mobile
  }

  double _getTabFontSize(double screenWidth) {
    if (screenWidth > 600) return 14; // Tablet
    return 12; // Mobile
  }

  double _getTabPadding(double screenWidth) {
    if (screenWidth > 600) return 20; // Tablet
    return 16; // Mobile
  }

  Widget _buildEducationTab(double screenWidth, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildInfoCard(
            context,
            title: "BSc in Computers & AI",
            subtitle: "Sohag University",
            period: "2021 - 2025",
            status: "4th Year (In Progress)",
            icon: Icons.school,
            screenWidth: screenWidth,
          ),
          SizedBox(height: _getCardSpacing(screenWidth)),
          _buildInfoCard(
            context,
            title: "Technical Diploma",
            subtitle: "Sohag Technical Industrial Institute",
            period: "2019 - 2021",
            status: "CGPA 3.85 / 4.00",
            icon: Icons.laptop_mac,
            screenWidth: screenWidth,
          ),
          SizedBox(height: _getCardSpacing(screenWidth)),
          _buildInfoCard(
            context,
            title: "GDSC Member",
            subtitle: "Sohag University Chapter",
            period: "2022 – 2023",
            status: "Participated in hackathons",
            icon: Icons.group,
            screenWidth: screenWidth,
          ),
        ],
      ),
    );
  }

  Widget _buildCoursesTab(double screenWidth, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildInfoCard(
            context,
            title: "Flutter & Dart Bootcamp",
            subtitle: "Udemy – Tharwat Samy",
            period: "2023",
            status: "Completed with Certificate",
            icon: Icons.phone_android,
            screenWidth: screenWidth,
          ),
          SizedBox(height: _getCardSpacing(screenWidth)),
          _buildInfoCard(
            context,
            title: "Firebase Masterclass",
            subtitle: "Advanced Backend",
            period: "2023",
            status: "Completed with Certificate",
            icon: Icons.cloud,
            screenWidth: screenWidth,
          ),
          SizedBox(height: _getCardSpacing(screenWidth)),
          _buildInfoCard(
            context,
            title: "RESTful API in Flutter",
            subtitle: "Built Apps with APIs",
            period: "2023",
            status: "Hands-on Projects",
            icon: Icons.api,
            screenWidth: screenWidth,
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceTab(double screenWidth, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildInfoCard(
            context,
            title: "Flutter Developer",
            subtitle: "Freelance Projects",
            period: "2023 – Present",
            status: "10+ Apps Delivered",
            icon: Icons.work,
            screenWidth: screenWidth,
          ),
          SizedBox(height: _getCardSpacing(screenWidth)),
          _buildInfoCard(
            context,
            title: "Instructor & Mentor",
            subtitle: "iSchool & Digital Egypt",
            period: "2024 – Present",
            status: "Teaching AI & Coding",
            icon: Icons.school,
            screenWidth: screenWidth,
          ),
          SizedBox(height: _getCardSpacing(screenWidth)),
          _buildInfoCard(
            context,
            title: "Volunteer Developer",
            subtitle: "Youth Initiatives",
            period: "2023 – 2024",
            status: "Contributed to coding clubs",
            icon: Icons.volunteer_activism,
            screenWidth: screenWidth,
          ),
          SizedBox(height: _getCardSpacing(screenWidth)),
          _buildInfoCard(
            context,
            title: "ICPC Programmer",
            subtitle: "Sohag University",
            period: "2022 – 2024",
            status: "Regional Participant",
            icon: Icons.code,
            screenWidth: screenWidth,
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsTab(double screenWidth, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSkillCategory(
            context,
            "Development",
            [
              "Flutter & Dart (Advanced)",
              "Firebase (Auth, Firestore)",
              "REST API Integration",
              "State Management (Bloc)",
              "MVVM Architecture",
              "Responsive UI Design",
              "Git & Version Control",
            ],
            screenWidth,
          ),
          SizedBox(height: 16),
          _buildSkillCategory(
            context,
            "Design",
            [
              "UI/UX Design Principles",
              "Figma Prototyping",
              "Material Design",
              "Animation in Flutter",
              "Responsive Design",
            ],
            screenWidth,
          ),
          SizedBox(height: 16),
          _buildSkillCategory(
            context,
            "Programming",
            [
              "C++ Programming",
              "PHP Development",
              "Algorithms",
              "Data Structures",
              "OOP Principles",
              "SQL Databases",
            ],
            screenWidth,
          ),
          SizedBox(height: 16),
          _buildSkillCategory(
            context,
            "Languages",
            [
              "Arabic (Native)",
              "English (Fluent)",
            ],
            screenWidth,
          ),
        ],
      ),
    );
  }

  double _getCardSpacing(double screenWidth) {
    if (screenWidth > 600) return 16; // Tablet
    return 12; // Mobile
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String period,
    required String status,
    required IconData icon,
    required double screenWidth,
  }) {
    final cardPadding = _getInfoCardPadding(screenWidth);
    final titleFontSize = _getInfoCardTitleSize(screenWidth);
    final subtitleFontSize = _getInfoCardSubtitleSize(screenWidth);
    final iconSize = _getInfoCardIconSize(screenWidth);
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: isLightMode ? LightThemeColors.bgCard : null,
        gradient: isLightMode
            ? null
            : LinearGradient(
                colors: [
                  Color(0xFF2C3E50).withOpacity(0.8),
                  Color(0xFF34495E).withOpacity(0.6),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isLightMode
              ? LightThemeColors.borderLight
              : Colors.cyanAccent.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isLightMode
                ? LightThemeColors.shadowLight
                : Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: iconSize,
            height: iconSize,
            decoration: BoxDecoration(
              color: isLightMode
                  ? LightThemeColors.bgSecondary
                  : Colors.cyanAccent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isLightMode
                    ? LightThemeColors.borderLight
                    : Colors.cyanAccent.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              color: isLightMode
                  ? LightThemeColors.primaryCyan
                  : Colors.cyanAccent,
              size: iconSize * 0.5,
            ),
          ),
          SizedBox(width: cardPadding * 0.6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isLightMode
                        ? LightThemeColors.primaryCyan
                        : Colors.cyanAccent,
                    fontWeight: FontWeight.w600,
                    fontSize: titleFontSize,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: isLightMode
                        ? LightThemeColors.textPrimary
                        : Colors.white.withOpacity(0.9),
                    fontSize: subtitleFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 6),
                Wrap(
                  spacing: 12,
                  runSpacing: 4,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.schedule,
                          color: isLightMode
                              ? LightThemeColors.textMuted
                              : Colors.white60,
                          size: 14,
                        ),
                        SizedBox(width: 4),
                        Text(
                          period,
                          style: TextStyle(
                            color: isLightMode
                                ? LightThemeColors.textMuted
                                : Colors.white60,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: isLightMode
                              ? LightThemeColors.success
                              : Colors.green,
                          size: 14,
                        ),
                        SizedBox(width: 4),
                        Text(
                          status,
                          style: TextStyle(
                            color: isLightMode
                                ? LightThemeColors.textSecondary
                                : Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _getInfoCardPadding(double screenWidth) {
    if (screenWidth > 600) return 20; // Tablet
    return 16; // Mobile
  }

  double _getInfoCardTitleSize(double screenWidth) {
    if (screenWidth > 600) return 16; // Tablet
    return 14; // Mobile
  }

  double _getInfoCardSubtitleSize(double screenWidth) {
    if (screenWidth > 600) return 14; // Tablet
    return 12; // Mobile
  }

  double _getInfoCardIconSize(double screenWidth) {
    if (screenWidth > 600) return 48; // Tablet
    return 40; // Mobile
  }

  Widget _buildSkillCategory(BuildContext context, String title,
      List<String> skills, double screenWidth) {
    final cardPadding = _getSkillCardPadding(screenWidth);
    final titleSize = _getSkillTitleSize(screenWidth);
    final skillFontSize = _getSkillFontSize(screenWidth);
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: isLightMode
            ? LightThemeColors.bgCard
            : Color(0xFF2C3E50).withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isLightMode
              ? LightThemeColors.borderLight
              : Colors.cyanAccent.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isLightMode
                ? LightThemeColors.shadowLight
                : Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isLightMode
                  ? LightThemeColors.primaryCyan
                  : Colors.cyanAccent,
              fontWeight: FontWeight.w600,
              fontSize: titleSize,
            ),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills
                .map((skill) => Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: _getSkillChipPadding(screenWidth),
                          vertical: 6),
                      decoration: BoxDecoration(
                        color: isLightMode
                            ? LightThemeColors.bgSecondary
                            : Colors.cyanAccent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isLightMode
                              ? LightThemeColors.borderLight
                              : Colors.cyanAccent.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        skill,
                        style: TextStyle(
                          color: isLightMode
                              ? LightThemeColors.textPrimary
                              : Colors.white.withOpacity(0.9),
                          fontSize: skillFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  double _getSkillCardPadding(double screenWidth) {
    if (screenWidth > 600) return 20; // Tablet
    return 16; // Mobile
  }

  double _getSkillTitleSize(double screenWidth) {
    if (screenWidth > 600) return 16; // Tablet
    return 14; // Mobile
  }

  double _getSkillFontSize(double screenWidth) {
    if (screenWidth > 600) return 13; // Tablet
    return 11; // Mobile
  }

  double _getSkillChipPadding(double screenWidth) {
    if (screenWidth > 600) return 12; // Tablet
    return 10; // Mobile
  }
}

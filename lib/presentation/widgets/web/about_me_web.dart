import 'package:flutter/material.dart';
import 'package:Ali_Maher/core/constant/theme.dart';

class AboutMeSectionWeb extends StatelessWidget {
  const AboutMeSectionWeb({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 1200;
    final isMediumScreen = screenWidth > 900 && screenWidth <= 1200;
    final isSmallScreen = screenWidth <= 900;
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Container(
      color: isLightMode ? LightThemeColors.bgPrimary : CustomColors.scaffold2,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: _getHorizontalPadding(screenWidth),
        vertical: _getVerticalPadding(screenWidth),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1400),
        child: Column(
          children: [
            _buildSectionHeader(screenWidth, isLightMode),
            SizedBox(height: _getSectionSpacing(screenWidth)),
            _buildMainContent(context, screenWidth, isLargeScreen,
                isMediumScreen, isSmallScreen),
          ],
        ),
      ),
    );
  }

  double _getHorizontalPadding(double screenWidth) {
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
    if (screenWidth > 1200) return 80;
    if (screenWidth > 900) return 60;
    return 40;
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
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
              TextSpan(
                text: "Me",
                style: TextStyle(
                  color:
                      isLightMode ? LightThemeColors.primaryCyan : Colors.cyan,
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

  Widget _buildMainContent(BuildContext context, double screenWidth,
      bool isLargeScreen, bool isMediumScreen, bool isSmallScreen) {
    if (isSmallScreen) {
      return Column(
        children: [
          _buildProfileCard(screenWidth, context),
          SizedBox(height: 60),
          _buildInfoTabs(screenWidth, context),
        ],
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileCard(screenWidth, context),
          SizedBox(width: _getContentSpacing(screenWidth)),
          Expanded(child: _buildInfoTabs(screenWidth, context)),
        ],
      );
    }
  }

  double _getContentSpacing(double screenWidth) {
    if (screenWidth > 1400) return 120;
    if (screenWidth > 1200) return 100;
    if (screenWidth > 900) return 80;
    return 60;
  }

  Widget _buildProfileCard(double screenWidth, context) {
    final cardWidth = _getProfileCardWidth(screenWidth);
    final avatarRadius = _getAvatarRadius(screenWidth);
    final cardPadding = _getCardPadding(screenWidth);
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return SizedBox(
      width: cardWidth,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: EdgeInsets.only(top: avatarRadius + 20),
            padding: EdgeInsets.only(
              top: avatarRadius + 30,
              left: cardPadding,
              right: cardPadding,
              bottom: cardPadding,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isLightMode
                    ? [
                        LightThemeColors.primaryCyan,
                        LightThemeColors.primaryCyanLight,
                      ]
                    : [
                        Colors.cyan,
                        Colors.cyan.withOpacity(0.8),
                      ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: isLightMode
                      ? LightThemeColors.shadowLight
                      : Colors.cyan.withOpacity(0.3),
                  blurRadius: 30,
                  offset: Offset(0, 15),
                ),
                BoxShadow(
                  color: isLightMode
                      ? LightThemeColors.shadowMedium
                      : Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "ALI MAHER",
                  style: TextStyle(
                    color: isLightMode
                        ? LightThemeColors.textOnPrimary
                        : Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: _getNameFontSize(screenWidth),
                    letterSpacing: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Container(
                  width: 60,
                  height: 2,
                  color: isLightMode
                      ? LightThemeColors.textOnPrimary.withOpacity(0.5)
                      : Colors.white.withOpacity(0.5),
                ),
                SizedBox(height: 24),
                _buildRoleChip(
                  "Software Engineer",
                  screenWidth,
                  context,
                ),
                SizedBox(height: 12),
                _buildRoleChip(
                  'Mobile Developer',
                  screenWidth,
                  context,
                ),
                SizedBox(height: 12),
                _buildRoleChip(
                  "Coding Instructor",
                  screenWidth,
                  context,
                ),
              ],
            ),
          ),
          Positioned(
            left: -70,
            right: 60,
            top: 35,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isLightMode
                        ? LightThemeColors.borderMedium
                        : Colors.white,
                    width: 6,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isLightMode
                          ? LightThemeColors.shadowLight
                          : Colors.black.withOpacity(0.25),
                      blurRadius: 25,
                      offset: Offset(-5, 10),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: avatarRadius,
                  backgroundImage: Image.asset(
                    "assets/MyPhoto/profile.png",
                    fit: BoxFit.cover,
                  ).image,
                  backgroundColor: Colors.grey[200],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _getProfileCardWidth(double screenWidth) {
    if (screenWidth > 1400) return 380;
    if (screenWidth > 1200) return 350;
    if (screenWidth > 900) return 320;
    return 280;
  }

  double _getAvatarRadius(double screenWidth) {
    if (screenWidth > 1200) return 80;
    if (screenWidth > 900) return 70;
    return 60;
  }

  double _getCardPadding(double screenWidth) {
    if (screenWidth > 1200) return 40;
    if (screenWidth > 900) return 32;
    return 24;
  }

  double _getNameFontSize(double screenWidth) {
    if (screenWidth > 1200) return 30;
    if (screenWidth > 900) return 26;
    return 22;
  }

  Widget _buildRoleChip(String role, double screenWidth, context) {
    final fontSize = _getChipFontSize(screenWidth);
    final padding = _getChipPadding(screenWidth);
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 8),
      decoration: BoxDecoration(
        color: isLightMode
            ? LightThemeColors.bgSecondary
            : Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isLightMode
              ? LightThemeColors.borderLight
              : Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        role,
        style: TextStyle(
          color: isLightMode ? LightThemeColors.textPrimary : Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  double _getChipFontSize(double screenWidth) {
    if (screenWidth > 1200) return 16;
    if (screenWidth > 900) return 14;
    return 12;
  }

  double _getChipPadding(double screenWidth) {
    if (screenWidth > 1200) return 20;
    if (screenWidth > 900) return 16;
    return 12;
  }

  Widget _buildInfoTabs(double screenWidth, context) {
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
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                style: BorderStyle.solid,
                color: isLightMode
                    ? LightThemeColors.borderLight
                    : Colors.cyan.withOpacity(0.4),
                width: 3,
              ),
            ),
            child: TabBar(
              padding: EdgeInsets.symmetric(horizontal: 30),
              isScrollable: screenWidth < 1000,
              indicatorPadding:
                  EdgeInsets.symmetric(horizontal: -20, vertical: 6),
              indicator: BoxDecoration(
                border: Border.all(
                  style: BorderStyle.solid,
                  color: isLightMode
                      ? LightThemeColors.borderLight
                      : Colors.cyan.withOpacity(0.4),
                  width: 1,
                ),
                color: isLightMode
                    ? LightThemeColors.primaryCyan.withOpacity(0.2)
                    : Colors.cyan.withOpacity(0.2),
                borderRadius: BorderRadius.circular(40),
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
                  horizontal: _getTabPadding(screenWidth) + 8, vertical: 16),
              tabs: [
                Tab(text: "Education"),
                Tab(text: "Courses"),
                Tab(text: "Experience"),
                Tab(text: "Skills"),
              ],
            ),
          ),
          SizedBox(height: 50),
          SizedBox(
            height: tabHeight,
            child: TabBarView(
              children: [
                _buildEducationTab(
                  screenWidth,
                  context,
                ),
                _buildCoursesTab(
                  screenWidth,
                  context,
                ),
                _buildExperienceTab(screenWidth, context),
                _buildSkillsTab(
                  screenWidth,
                  context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double _getTabHeight(double screenWidth) {
    if (screenWidth > 1400) return 500;
    if (screenWidth > 1200) return 450;
    if (screenWidth > 900) return 420;
    return 380;
  }

  double _getTabFontSize(double screenWidth) {
    if (screenWidth > 1200) return 16;
    if (screenWidth > 900) return 14;
    return 12;
  }

  double _getTabPadding(double screenWidth) {
    if (screenWidth > 1200) return 40;
    if (screenWidth > 900) return 30;
    return 22;
  }

  Widget _buildEducationTab(
    double screenWidth,
    BuildContext context,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildInfoCard(
            context,
            title: "BSc in Computers & Artificial Intelligence",
            subtitle: "Sohag University",
            period: "2021 - 2025",
            status: "4th Year (In Progress)",
            icon: Icons.school,
            screenWidth: screenWidth,
          ),
          SizedBox(height: _getCardSpacing(screenWidth)),
          _buildInfoCard(
            context,
            title: "Technical Diploma in Computer Technology",
            subtitle: "Sohag Technical Industrial Institute",
            period: "2019 - 2021",
            status: "CGPA 3.85 / 4.00",
            icon: Icons.laptop_mac,
            screenWidth: screenWidth,
          ),
          SizedBox(height: _getCardSpacing(screenWidth)),
          _buildInfoCard(
            context,
            title: "Member – Google Developer Student Clubs (GDSC)",
            subtitle: "Sohag University Chapter",
            period: "2022 – 2023",
            status: "Participated in sessions, hackathons & community learning",
            icon: Icons.group,
            screenWidth: screenWidth,
          ),
        ],
      ),
    );
  }

  Widget _buildCoursesTab(
    double screenWidth,
    BuildContext context,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildInfoCard(
            context,
            title: "Flutter & Dart Development Bootcamp",
            subtitle: "Udemy – Tharwat Samy",
            period: "2023",
            status: "Completed with Certificate (Beginner to Advanced)",
            icon: Icons.phone_android,
            screenWidth: screenWidth,
          ),
          SizedBox(height: _getCardSpacing(screenWidth)),
          _buildInfoCard(
            context,
            title: "Firebase Masterclass for Flutter",
            subtitle: "Advanced Backend & Authentication",
            period: "2023",
            status: "Completed with Certificate",
            icon: Icons.cloud,
            screenWidth: screenWidth,
          ),
          SizedBox(height: _getCardSpacing(screenWidth)),
          _buildInfoCard(
            context,
            title: "RESTful API Integration in Flutter",
            subtitle: "Built Real Apps with Multiple APIs",
            period: "2023",
            status: "Hands-on Projects Implemented",
            icon: Icons.api,
            screenWidth: screenWidth,
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceTab(double screenWidth, context) {
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
            subtitle: "iSchool & Digital Egypt Initiatives",
            period: "May 2024 – Present",
            status: "Teaching AI, Python & coding to ages 8-18",
            icon: Icons.school,
            screenWidth: screenWidth,
          ),
          SizedBox(height: _getCardSpacing(screenWidth)),
          _buildInfoCard(
              title: "Volunteer Developer & Participant",
              subtitle: "Ministry of Communications – Youth Initiatives",
              period: "2023 – 2024",
              status: "Contributed to coding clubs & digital skills programs",
              icon: Icons.volunteer_activism,
              screenWidth: screenWidth,
              context),
          SizedBox(height: _getCardSpacing(screenWidth)),
          _buildInfoCard(
            title: "ICPC Competitive Programmer",
            subtitle: "Faculty of CS & AI, Sohag University",
            period: "2022 – 2024",
            status: "Regional Participant in Programming Contests",
            icon: Icons.code,
            context,
            screenWidth: screenWidth,
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsTab(double screenWidth, context) {
    final isLargeScreen = screenWidth > 1200;

    return SingleChildScrollView(
      child: isLargeScreen
          ? Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildSkillCategory(
                        context,
                        "Development",
                        [
                          "Flutter & Dart (Advanced)",
                          "Firebase Integration (Auth, Firestore, Storage)",
                          "REST API Development & Integration",
                          "State Management (Cubit, Bloc)",
                          "MVVM Architecture",
                          "Responsive & Adaptive UI Design",
                          "Git & Version Control",
                        ],
                        screenWidth,
                      ),
                    ),
                    SizedBox(width: 24),
                    Expanded(
                      child: _buildSkillCategory(
                        context,
                        "Design",
                        [
                          "UI/UX Design Principles",
                          "Figma Prototyping & Wireframing",
                          "Material Design Guidelines",
                          "Animation & Motion Design (flutter_animate, animated_widgets)",
                          "Responsive Design for Web & Mobile",
                          "User-Centered Design",
                        ],
                        screenWidth,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                _buildSkillCategory(
                  context,
                  "Programming & Academic Skills",
                  [
                    "C++ Programming",
                    "PHP Development",
                    "Algorithms & Problem Solving",
                    "Data Structures (Arrays, Linked Lists, Trees, Graphs)",
                    "Object-Oriented Programming (OOP)",
                    "Database Fundamentals (SQL)",
                    "Software Engineering Principles",
                  ],
                  screenWidth,
                ),
                SizedBox(height: 24),
                _buildSkillCategory(
                  context,
                  "Languages",
                  [
                    "Arabic (Native)",
                    "English (Fluent - Reading, Writing, Speaking)",
                  ],
                  screenWidth,
                ),
              ],
            )
          : Column(
              children: [
                _buildSkillCategory(
                  context,
                  "Development",
                  [
                    "Flutter & Dart (Advanced)",
                    "Firebase Integration (Auth, Firestore, Storage)",
                    "REST API Development & Integration",
                    "State Management (Cubit, Bloc)",
                    "MVVM Architecture",
                    "Responsive & Adaptive UI Design",
                    "Git & Version Control",
                  ],
                  screenWidth,
                ),
                SizedBox(height: 24),
                _buildSkillCategory(
                  context,
                  "Design",
                  [
                    "UI/UX Design Principles",
                    "Figma Prototyping & Wireframing",
                    "Material Design Guidelines",
                    "Animation & Motion Design (flutter_animate, animated_widgets)",
                    "Responsive Design for Web & Mobile",
                    "User-Centered Design",
                  ],
                  screenWidth,
                ),
                SizedBox(height: 24),
                _buildSkillCategory(
                  context,
                  "Programming & Academic Skills",
                  [
                    "C++ Programming",
                    "PHP Development",
                    "Algorithms & Problem Solving",
                    "Data Structures (Arrays, Linked Lists, Trees, Graphs)",
                    "Object-Oriented Programming (OOP)",
                    "Database Fundamentals (SQL)",
                    "Software Engineering Principles",
                  ],
                  screenWidth,
                ),
                SizedBox(height: 24),
                _buildSkillCategory(
                  context,
                  "Languages",
                  [
                    "Arabic (Native)",
                    "English (Fluent - Reading, Writing, Speaking)",
                  ],
                  screenWidth,
                ),
              ],
            ),
    );
  }

  double _getCardSpacing(double screenWidth) {
    if (screenWidth > 1200) return 24;
    if (screenWidth > 900) return 20;
    return 16;
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
                  Color(0xFF2C3E50).withOpacity(0.9),
                  Color(0xFF34495E).withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isLightMode
              ? LightThemeColors.borderLight
              : Colors.cyan.withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isLightMode
                ? LightThemeColors.shadowLight
                : Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
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
                  : Colors.cyan.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isLightMode
                    ? LightThemeColors.borderLight
                    : Colors.cyan.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              color: isLightMode ? LightThemeColors.primaryCyan : Colors.cyan,
              size: iconSize * 0.5,
            ),
          ),
          SizedBox(width: cardPadding * 0.8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isLightMode
                        ? LightThemeColors.primaryCyan
                        : Colors.cyan,
                    fontWeight: FontWeight.w700,
                    fontSize: titleFontSize,
                  ),
                ),
                SizedBox(height: 6),
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
                SizedBox(height: 8),
                Wrap(
                  spacing: 16,
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
                          size: 16,
                        ),
                        SizedBox(width: 6),
                        Text(
                          period,
                          style: TextStyle(
                            color: isLightMode
                                ? LightThemeColors.textMuted
                                : Colors.white60,
                            fontSize: 13,
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
                          size: 16,
                        ),
                        SizedBox(width: 6),
                        Text(
                          status,
                          style: TextStyle(
                            color: isLightMode
                                ? LightThemeColors.textSecondary
                                : Colors.white70,
                            fontSize: 13,
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
    if (screenWidth > 1200) return 28;
    if (screenWidth > 900) return 24;
    return 20;
  }

  double _getInfoCardTitleSize(double screenWidth) {
    if (screenWidth > 1200) return 20;
    if (screenWidth > 900) return 18;
    return 16;
  }

  double _getInfoCardSubtitleSize(double screenWidth) {
    if (screenWidth > 1200) return 16;
    if (screenWidth > 900) return 15;
    return 14;
  }

  double _getInfoCardIconSize(double screenWidth) {
    if (screenWidth > 1200) return 60;
    if (screenWidth > 900) return 50;
    return 45;
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
            : Color(0xFF2C3E50).withOpacity(0.8),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isLightMode ? LightThemeColors.primaryCyan : Colors.cyan,
              fontWeight: FontWeight.w700,
              fontSize: titleSize,
            ),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills
                .map((skill) => Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: _getSkillChipPadding(screenWidth),
                          vertical: 8),
                      decoration: BoxDecoration(
                        color: isLightMode
                            ? LightThemeColors.bgSecondary
                            : Colors.cyan.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isLightMode
                              ? LightThemeColors.borderLight
                              : Colors.cyan.withOpacity(0.3),
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
    if (screenWidth > 1200) return 24;
    if (screenWidth > 900) return 20;
    return 16;
  }

  double _getSkillTitleSize(double screenWidth) {
    if (screenWidth > 1200) return 20;
    if (screenWidth > 900) return 18;
    return 16;
  }

  double _getSkillFontSize(double screenWidth) {
    if (screenWidth > 1200) return 15;
    if (screenWidth > 900) return 13;
    return 12;
  }

  double _getSkillChipPadding(double screenWidth) {
    if (screenWidth > 1200) return 16;
    if (screenWidth > 900) return 12;
    return 10;
  }
}

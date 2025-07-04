import 'package:Ali_Maher/core/constant/theme.dart';
import 'package:Ali_Maher/presentation/widgets/shared_contact_me.dart';
import 'package:Ali_Maher/presentation/widgets/shared_my_services.dart'
    as ResponsiveHelper;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContactMeMobile extends StatefulWidget {
  const ContactMeMobile({super.key});

  @override
  State<ContactMeMobile> createState() => _ContactMeMobileState();
}

class _ContactMeMobileState extends State<ContactMeMobile> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _subjectController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _subjectController.dispose();
    _emailController.dispose();
    _messageController.dispose();
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
          _buildSectionHeader(screenWidth, isLightMode),
          SizedBox(height: ResponsiveHelper.getSectionSpacing(screenWidth)),
          _buildContactContent(context, screenWidth, isLightMode),
          SizedBox(height: ResponsiveHelper.getSectionSpacing(screenWidth)),
          _buildFooter(isLightMode),
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
                text: "Contact ",
                style: TextStyle(
                  color:
                      isLightMode ? LightThemeColors.textPrimary : Colors.white,
                  fontSize: ResponsiveHelper.getTitleFontSize(screenWidth),
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
              TextSpan(
                text: "Me",
                style: TextStyle(
                  color:
                      isLightMode ? LightThemeColors.primaryCyan : Colors.cyan,
                  fontSize: ResponsiveHelper.getTitleFontSize(screenWidth),
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: ResponsiveHelper.getUnderlineWidth(screenWidth),
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
    ).animate().fadeIn(duration: const Duration(milliseconds: 400)).slideY(
          begin: -0.3,
          end: 0.0,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 600),
        );
  }

  Widget _buildContactContent(
      BuildContext context, double screenWidth, bool isLightMode) {
    return Container(
      padding: EdgeInsets.all(ResponsiveHelper.getSkillPadding(screenWidth)),
      decoration: BoxDecoration(
        color: isLightMode
            ? LightThemeColors.bgCard
            : const Color(0xFF2C3E50).withOpacity(0.8),
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
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          _buildIntroSection(screenWidth, isLightMode),
          SizedBox(height: ResponsiveHelper.getSectionSpacing(screenWidth)),
          _buildSocialIcons(isLightMode),
          SizedBox(height: ResponsiveHelper.getSectionSpacing(screenWidth)),
          _buildContactForm(isLightMode, screenWidth),
        ],
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 600)).slideY(
          begin: 0.3,
          end: 0.0,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 800),
        );
  }

  Widget _buildIntroSection(double screenWidth, bool isLightMode) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isLightMode ? LightThemeColors.primaryCyan : Colors.cyan,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color:
                    (isLightMode ? LightThemeColors.primaryCyan : Colors.cyan)
                        .withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.code,
                color:
                    isLightMode ? LightThemeColors.textOnPrimary : Colors.white,
                size: 20,
              ),
              const SizedBox(width: 6),
              Text(
                'AM',
                style: TextStyle(
                  color: isLightMode
                      ? LightThemeColors.textOnPrimary
                      : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'I am a passionate Flutter developer with hands-on experience in building high-quality mobile apps. I’ve developed more than 10 complete applications using clean architecture, state management, Firebase, and REST APIs.',
          style: TextStyle(
            color: isLightMode
                ? LightThemeColors.textSecondary
                : Colors.white.withOpacity(0.8),
            fontSize: ResponsiveHelper.getSkillFontSize(screenWidth) - 2,
            height: 1.4,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ).animate().fadeIn(duration: const Duration(milliseconds: 600));
  }

  Widget _buildSocialIcons(bool isLightMode) {
    final socialIcons = ContactMeShared.getSocialIcons(isLightMode);
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12,
      runSpacing: 12,
      children: socialIcons.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> social = entry.value;

        return Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: isLightMode
                ? LightThemeColors.bgCard
                : const Color(0xFF2C3E50).withOpacity(0.8),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isLightMode
                  ? LightThemeColors.borderLight
                  : Colors.cyan.withOpacity(0.2),
              width: 1,
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
              borderRadius: BorderRadius.circular(24),
              onTap: () {
                HapticFeedback.lightImpact();
                social['onTap'](context);
              },
              child: Center(
                child: Icon(
                  social['icon'] as IconData,
                  color: social['color'] as Color,
                  size: 22,
                ),
              ),
            ),
          ),
        ).animate(delay: Duration(milliseconds: 100 * index)).fadeIn(
              duration: const Duration(milliseconds: 400),
            );
      }).toList(),
    );
  }

  Widget _buildContactForm(bool isLightMode, double screenWidth) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContactMeShared.buildAnimatedTextField(
            controller: _firstNameController,
            label: 'First Name',
            delay: 0,
            isLightMode: isLightMode,
          ),
          const SizedBox(height: 16),
          ContactMeShared.buildAnimatedTextField(
            controller: _lastNameController,
            label: 'Last Name',
            delay: 100,
            isLightMode: isLightMode,
          ),
          const SizedBox(height: 16),
          ContactMeShared.buildAnimatedTextField(
            controller: _phoneController,
            label: 'Phone',
            delay: 200,
            keyboardType: TextInputType.phone,
            isLightMode: isLightMode,
          ),
          const SizedBox(height: 16),
          ContactMeShared.buildAnimatedTextField(
            controller: _subjectController,
            label: 'Subject',
            delay: 300,
            isLightMode: isLightMode,
          ),
          const SizedBox(height: 16),
          ContactMeShared.buildAnimatedTextField(
            controller: _emailController,
            label: 'Email',
            delay: 400,
            keyboardType: TextInputType.emailAddress,
            isLightMode: isLightMode,
          ),
          const SizedBox(height: 16),
          ContactMeShared.buildAnimatedTextField(
            controller: _messageController,
            label: 'Message',
            delay: 500,
            maxLines: 4,
            isLightMode: isLightMode,
          ),
          const SizedBox(height: 24),
          _buildSubmitButton(isLightMode, screenWidth),
        ],
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 600)).slideY(
          begin: 0.3,
          end: 0.0,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 800),
        );
  }

  Widget _buildSubmitButton(bool isLightMode, double screenWidth) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isLightMode
              ? [
                  LightThemeColors.primaryCyan,
                  LightThemeColors.primaryCyan.withOpacity(0.7),
                ]
              : [
                  Colors.cyan,
                  Colors.cyan.withOpacity(0.7),
                ],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: (isLightMode ? LightThemeColors.primaryCyan : Colors.cyan)
                .withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            HapticFeedback.mediumImpact();
            ContactMeShared.handleSubmit(
              context: context,
              formKey: _formKey,
              firstNameController: _firstNameController,
              lastNameController: _lastNameController,
              phoneController: _phoneController,
              subjectController: _subjectController,
              emailController: _emailController,
              messageController: _messageController,
            );
          },
          child: Center(
            child: Text(
              'Submit',
              style: TextStyle(
                color:
                    isLightMode ? LightThemeColors.textOnPrimary : Colors.white,
                fontSize: ResponsiveHelper.getSkillFontSize(screenWidth),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 400));
  }

  Widget _buildFooter(bool isLightMode) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
            isLightMode ? LightThemeColors.bgSecondary : CustomColors.scaffold2,
        border: Border(
          top: BorderSide(
            color: isLightMode
                ? LightThemeColors.borderLight
                : Colors.cyan.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Text(
        'Copywrite 2024 All Rights Reserved By Ali Maher.',
        style: TextStyle(
          color: isLightMode ? LightThemeColors.textMuted : Colors.white70,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
    ).animate().fadeIn(duration: const Duration(milliseconds: 400));
  }
}

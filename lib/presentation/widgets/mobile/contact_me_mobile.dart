import 'package:Ali_Maher/core/constant/theme.dart';
import 'package:Ali_Maher/presentation/widgets/contact_me_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactMeMobile extends StatefulWidget {
  const ContactMeMobile({super.key});

  @override
  State<ContactMeMobile> createState() => _ContactMeMobileState();
}

class _ContactMeMobileState extends State<ContactMeMobile>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _formController;
  late AnimationController _socialController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _socialAnimation;

  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _subjectController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _fadeController = ContactMeShared.createFadeController(this);
    _slideController = ContactMeShared.createSlideController(this);
    _formController = ContactMeShared.createFormController(this);
    _socialController = ContactMeShared.createSocialController(this);

    _fadeAnimation = ContactMeShared.createFadeAnimation(_fadeController);
    _slideAnimation = ContactMeShared.createSlideAnimation(_slideController);
    _socialAnimation = ContactMeShared.createSocialAnimation(_socialController);

    Future.delayed(
        const Duration(milliseconds: 300), () => _fadeController.forward());
    Future.delayed(
        const Duration(milliseconds: 500), () => _slideController.forward());
    Future.delayed(
        const Duration(milliseconds: 700), () => _formController.forward());
    Future.delayed(
        const Duration(milliseconds: 900), () => _socialController.forward());
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _formController.dispose();
    _socialController.dispose();
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
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      backgroundColor:
          isLightMode ? LightThemeColors.bgPrimary : const Color(0xFF2D3748),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isLightMode
                ? [
                    LightThemeColors.bgPrimary,
                    LightThemeColors.bgSecondary,
                  ]
                : [
                    const Color(0xFF2D3748),
                    const Color(0xFF1A1F2E),
                  ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Contact ',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: isLightMode
                                      ? LightThemeColors.textPrimary
                                      : Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: 'Me',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..shader = LinearGradient(
                                      colors: isLightMode
                                          ? [
                                              LightThemeColors.primaryCyan,
                                              LightThemeColors.primaryCyan
                                            ]
                                          : [
                                              Colors.cyanAccent,
                                              Colors.cyanAccent
                                            ],
                                    ).createShader(
                                        const Rect.fromLTWH(0, 0, 100, 40)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SlideTransition(
                      position: _slideAnimation,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isLightMode
                                  ? LightThemeColors.primaryCyan
                                  : const Color(0xFF00D4FF),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: (isLightMode
                                          ? LightThemeColors.primaryCyan
                                          : const Color(0xFF00D4FF))
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
                                  color: isLightMode
                                      ? LightThemeColors.textOnPrimary
                                      : Colors.white,
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
                            'I am a passionate Flutter developer with hands-on experience in building high-quality mobile apps. I’ve developed more than 10 complete applications using clean architecture, state management, Firebase, and REST APIs. Whether it’s a business, medical, or e-commerce app, I deliver modern and responsive UI with top performance. Your satisfaction and app usability are always my priority.',
                            style: TextStyle(
                              color: isLightMode
                                  ? LightThemeColors.textSecondary
                                  : Colors.white70,
                              fontSize: 14,
                              height: 1.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildSocialIcons(isLightMode),
                    const SizedBox(height: 24),
                    _buildContactForm(isLightMode),
                  ],
                ),
              ),
            ),
            _buildFooter(isLightMode),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcons(bool isLightMode) {
    final socialIcons = ContactMeShared.getSocialIcons(isLightMode);
    return ScaleTransition(
      scale: _socialAnimation,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 12,
        runSpacing: 12,
        children: socialIcons.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> social = entry.value;

          return TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 600 + (index * 100)),
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isLightMode
                        ? LightThemeColors.bgCard
                        : const Color(0xFF4A5568),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: isLightMode
                          ? LightThemeColors.borderLight
                          : Colors.white24,
                      width: 1,
                    ),
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
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContactForm(bool isLightMode) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 0.5),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _formController,
        curve: Curves.easeOutBack,
      )),
      child: Form(
        key: _formKey,
        child: Column(
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
            _buildSubmitButton(isLightMode),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton(bool isLightMode) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1000),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isLightMode
                    ? [
                        LightThemeColors.primaryCyan,
                        LightThemeColors.primaryCyan.withOpacity(0.7)
                      ]
                    : [const Color(0xFF00D4FF), const Color(0xFF00A8CC)],
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: (isLightMode
                          ? LightThemeColors.primaryCyan
                          : const Color(0xFF00D4FF))
                      .withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
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
                      color: isLightMode
                          ? LightThemeColors.textOnPrimary
                          : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFooter(bool isLightMode) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isLightMode
            ? LightThemeColors.bgSecondary
            : const Color(0xFF1A1F2E),
        border: Border(
          top: BorderSide(
            color: isLightMode ? LightThemeColors.borderLight : Colors.white12,
            width: 1,
          ),
        ),
      ),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Text(
          'Copywrite 2024 All Rights Reserved By Ali Maher.',
          style: TextStyle(
            color: isLightMode ? LightThemeColors.textMuted : Colors.white70,
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

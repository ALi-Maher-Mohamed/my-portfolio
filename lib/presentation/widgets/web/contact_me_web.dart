import 'package:Ali_Maher/core/constant/colors.dart';
import 'package:Ali_Maher/core/constant/send_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Ali_Maher/core/constant/launch_url.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactMePage extends StatefulWidget {
  const ContactMePage({super.key});

  @override
  State<ContactMePage> createState() => _ContactMePageState();
}

class _ContactMePageState extends State<ContactMePage>
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

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _formController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _socialController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-0.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticOut,
    ));

    _socialAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _socialController,
      curve: Curves.bounceOut,
    ));

    // Start animations with delays
    Future.delayed(const Duration(milliseconds: 300), () {
      _fadeController.forward();
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      _slideController.forward();
    });

    Future.delayed(const Duration(milliseconds: 700), () {
      _formController.forward();
    });

    Future.delayed(const Duration(milliseconds: 900), () {
      _socialController.forward();
    });
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
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isLightMode
                ? [
                    LightThemeColors.bgPrimary,
                    LightThemeColors.bgSecondary,
                    LightThemeColors.bgSecondary.withOpacity(0.8),
                  ]
                : [
                    const Color(0xFF2D3748),
                    const Color(0xFF1A1F2E),
                    const Color(0xFF0F1419),
                  ],
          ),
        ),
        child: Column(
          children: [
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: SafeArea(
                  child: Column(
                    children: [
                      // Title Animation
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 40),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Contact ',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: isLightMode
                                        ? LightThemeColors.textPrimary
                                        : Colors.white,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Me',
                                  style: TextStyle(
                                    fontSize: 32,
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
                                                    .withOpacity(0.7),
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

                      // Content Row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left Side - Logo and Description
                          Expanded(
                            flex: 1,
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Logo with Animation
                                  ScaleTransition(
                                    scale: _socialAnimation,
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: isLightMode
                                            ? LightThemeColors.primaryCyan
                                            : const Color(0xFF00D4FF),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: (isLightMode
                                                    ? LightThemeColors
                                                        .primaryCyan
                                                    : const Color(0xFF00D4FF))
                                                .withOpacity(0.3),
                                            blurRadius: 15,
                                            offset: const Offset(0, 5),
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
                                            size: 24,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'AM',
                                            style: TextStyle(
                                              color: isLightMode
                                                  ? LightThemeColors
                                                      .textOnPrimary
                                                  : Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 30),

                                  // Description
                                  FadeTransition(
                                    opacity: _fadeAnimation,
                                    child: Text(
                                      'I am a passionate Flutter developer with hands-on experience in building high-quality mobile apps. I’ve developed more than 10 complete applications using clean architecture, state management, Firebase, and REST APIs. Whether it’s a business, medical, or e-commerce app, I deliver modern and responsive UI with top performance. Your satisfaction and app usability are always my priority.',
                                      style: TextStyle(
                                        color: isLightMode
                                            ? LightThemeColors.textSecondary
                                            : Colors.white70,
                                        fontSize: 16,
                                        height: 1.6,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 40),

                                  // Social Icons
                                  _buildSocialIcons(isLightMode),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(width: 40),

                          // Right Side - Contact Form
                          Expanded(
                            flex: 1,
                            child: _buildContactForm(isLightMode),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Footer
            _buildFooter(isLightMode),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcons(bool isLightMode) {
    final socialIcons = [
      {
        'icon': Icons.phone,
        'color': isLightMode
            ? LightThemeColors.primaryCyan
            : const Color(0xFF00D4FF),
        'onTap': () => launchDialer('+01278408531')
      },
      {
        'icon': FontAwesomeIcons.whatsapp,
        'color': isLightMode
            ? LightThemeColors.primaryCyan
            : const Color(0xFF00D4FF),
        'onTap': () =>
            launchCustomUrl(context, url: 'https://wa.me/+01278408531')
      },
      {
        'icon': Icons.email,
        'color': isLightMode
            ? LightThemeColors.primaryCyan
            : const Color(0xFF00D4FF),
        'onTap': () => launchCustomUrl(context,
            url: 'mailto:ali.maher0013@gmail.com?subject=Hello')
      },
      {
        'icon': Icons.location_on,
        'color': isLightMode
            ? LightThemeColors.primaryCyan
            : const Color(0xFF00D4FF),
        'onTap': () => launchCustomUrl(context,
            url: 'https://maps.app.goo.gl/ume2cr9TWhpu8oxe6')
      },
      {
        'icon': Icons.facebook,
        'color': isLightMode
            ? LightThemeColors.primaryCyan
            : const Color(0xFF00D4FF),
        'onTap': () => launchCustomUrl(context,
            url: 'https://www.facebook.com/ali.maher.403247')
      },
    ];

    return ScaleTransition(
      scale: _socialAnimation,
      child: Row(
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
                  margin: const EdgeInsets.only(right: 15),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {
                        HapticFeedback.lightImpact();
                        social['onTap']();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: isLightMode
                              ? LightThemeColors.bgCard
                              : const Color(0xFF4A5568),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: isLightMode
                                ? LightThemeColors.borderLight
                                : Colors.white24,
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          social['icon'] as IconData,
                          color: social['color'] as Color,
                          size: 24,
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
        begin: const Offset(0.5, 0),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _formController,
        curve: Curves.easeOutBack,
      )),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // First Name and Last Name Row
            Row(
              children: [
                Expanded(
                  child: _buildAnimatedTextField(
                    controller: _firstNameController,
                    label: 'First Name',
                    delay: 0,
                    isLightMode: isLightMode,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildAnimatedTextField(
                    controller: _lastNameController,
                    label: 'Last Name',
                    delay: 100,
                    isLightMode: isLightMode,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Phone and Subject Row
            Row(
              children: [
                Expanded(
                  child: _buildAnimatedTextField(
                    controller: _phoneController,
                    label: 'Phone',
                    delay: 200,
                    keyboardType: TextInputType.phone,
                    isLightMode: isLightMode,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildAnimatedTextField(
                    controller: _subjectController,
                    label: 'Subject',
                    delay: 300,
                    isLightMode: isLightMode,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Email
            _buildAnimatedTextField(
              controller: _emailController,
              label: 'Email',
              delay: 400,
              keyboardType: TextInputType.emailAddress,
              isLightMode: isLightMode,
            ),

            const SizedBox(height: 20),

            // Message
            _buildAnimatedTextField(
              controller: _messageController,
              label: 'Message',
              delay: 500,
              maxLines: 4,
              isLightMode: isLightMode,
            ),

            const SizedBox(height: 30),

            // Submit Button
            _buildSubmitButton(isLightMode),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedTextField({
    required TextEditingController controller,
    required String label,
    required int delay,
    TextInputType? keyboardType,
    int maxLines = 1,
    required bool isLightMode,
  }) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 800 + delay),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, (1 - value) * 30),
          child: Opacity(
            opacity: value,
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              maxLines: maxLines,
              style: TextStyle(
                color:
                    isLightMode ? LightThemeColors.textPrimary : Colors.white,
              ),
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(
                  color:
                      isLightMode ? LightThemeColors.textMuted : Colors.white70,
                ),
                filled: true,
                fillColor: isLightMode
                    ? LightThemeColors.bgCard
                    : const Color(0xFF4A5568),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: isLightMode
                        ? LightThemeColors.primaryCyan
                        : const Color(0xFF00D4FF),
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                if (label == 'Email' && !value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
          ),
        );
      },
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
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isLightMode
                    ? [
                        LightThemeColors.primaryCyan,
                        LightThemeColors.primaryCyan.withOpacity(0.7),
                      ]
                    : [
                        const Color(0xFF00D4FF),
                        const Color(0xFF00A8CC),
                      ],
              ),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: (isLightMode
                          ? LightThemeColors.primaryCyan
                          : const Color(0xFF00D4FF))
                      .withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: () {
                  HapticFeedback.mediumImpact();
                  if (_formKey.currentState!.validate()) {
                    _handleSubmit();
                  }
                },
                child: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: isLightMode
                          ? LightThemeColors.textOnPrimary
                          : Colors.white,
                      fontSize: 18,
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
      padding: const EdgeInsets.all(20),
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
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _handleSubmit() async {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    if (_formKey.currentState!.validate()) {
      try {
        await sendEmail(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          phone: _phoneController.text.trim(),
          subject: _subjectController.text.trim(),
          email: _emailController.text.trim(),
          message: _messageController.text.trim(),
        );

        // Show success snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Message sent successfully!'),
            backgroundColor: isLightMode
                ? LightThemeColors.primaryCyan
                : const Color(0xFF00D4FF),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );

        // Clear form fields
        _firstNameController.clear();
        _lastNameController.clear();
        _phoneController.clear();
        _subjectController.clear();
        _emailController.clear();
        _messageController.clear();
      } catch (e) {
        // Show error snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                const Text('Failed to send message. Please try again later.'),
            backgroundColor:
                isLightMode ? LightThemeColors.error : Colors.redAccent,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }
    }
  }
}

import 'package:Ali_Maher/core/constant/theme.dart';
import 'package:Ali_Maher/core/constant/send_email.dart';
import 'package:Ali_Maher/core/constant/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactMeShared {
  static AnimationController createFadeController(TickerProvider vsync) {
    return AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: vsync,
    );
  }

  static AnimationController createSlideController(TickerProvider vsync) {
    return AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: vsync,
    );
  }

  static AnimationController createFormController(TickerProvider vsync) {
    return AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: vsync,
    );
  }

  static AnimationController createSocialController(TickerProvider vsync) {
    return AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: vsync,
    );
  }

  static Animation<double> createFadeAnimation(AnimationController controller) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  static Animation<Offset> createSlideAnimation(
      AnimationController controller) {
    return Tween<Offset>(begin: const Offset(-0.5, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut));
  }

  static Animation<double> createSocialAnimation(
      AnimationController controller) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.bounceOut),
    );
  }

  static List<Map<String, dynamic>> getSocialIcons(bool isLightMode) {
    return [
      {
        'icon': Icons.phone,
        'color': isLightMode
            ? LightThemeColors.primaryCyan
            : const Color(0xFF00D4FF),
        'onTap': () => launchDialer('+01278408531'),
      },
      {
        'icon': FontAwesomeIcons.whatsapp,
        'color': isLightMode
            ? LightThemeColors.primaryCyan
            : const Color(0xFF00D4FF),
        'onTap': (BuildContext context) =>
            launchCustomUrl(context, url: 'https://wa.me/+01278408531'),
      },
      {
        'icon': Icons.email,
        'color': isLightMode
            ? LightThemeColors.primaryCyan
            : const Color(0xFF00D4FF),
        'onTap': (BuildContext context) => launchCustomUrl(context,
            url: 'mailto:ali.maher0013@gmail.com?subject=Hello'),
      },
      {
        'icon': Icons.location_on,
        'color': isLightMode
            ? LightThemeColors.primaryCyan
            : const Color(0xFF00D4FF),
        'onTap': (BuildContext context) => launchCustomUrl(context,
            url: 'https://maps.app.goo.gl/ume2cr9TWhpu8oxe6'),
      },
      {
        'icon': Icons.facebook,
        'color': isLightMode
            ? LightThemeColors.primaryCyan
            : const Color(0xFF00D4FF),
        'onTap': (BuildContext context) => launchCustomUrl(context,
            url: 'https://www.facebook.com/ali.maher.403247'),
      },
    ];
  }

  static Widget buildAnimatedTextField({
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

  static Future<void> handleSubmit({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController firstNameController,
    required TextEditingController lastNameController,
    required TextEditingController phoneController,
    required TextEditingController subjectController,
    required TextEditingController emailController,
    required TextEditingController messageController,
  }) async {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    if (formKey.currentState!.validate()) {
      try {
        await sendEmail(
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          phone: phoneController.text.trim(),
          subject: subjectController.text.trim(),
          email: emailController.text.trim(),
          message: messageController.text.trim(),
        );

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

        firstNameController.clear();
        lastNameController.clear();
        phoneController.clear();
        subjectController.clear();
        emailController.clear();
        messageController.clear();
      } catch (e) {
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

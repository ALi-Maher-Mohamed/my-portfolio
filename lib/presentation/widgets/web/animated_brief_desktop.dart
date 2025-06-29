import 'package:Ali_Maher/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Ali_Maher/core/constant/launch_url.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedPortfolioBrief extends StatefulWidget {
  const AnimatedPortfolioBrief({super.key});

  @override
  _AnimatedPortfolioBriefState createState() => _AnimatedPortfolioBriefState();
}

class _AnimatedPortfolioBriefState extends State<AnimatedPortfolioBrief>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _typewriterController;
  late AnimationController _bounceController;
  late AnimationController _iconController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _bounceAnimation;
  late Animation<double> _iconAnimation;

  String _displayedText = '';
  final String _fullText = 'Flutter Developer';
  int _currentIndex = 0;
  bool _hasStartedAnimations = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _typewriterController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _bounceController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _iconController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Initialize animations
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticOut,
    ));

    _bounceAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _bounceController,
      curve: Curves.elasticOut,
    ));

    _iconAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _iconController,
      curve: Curves.elasticOut,
    ));
  }

  void _startAnimations() async {
    if (_hasStartedAnimations || !mounted) return;
    _hasStartedAnimations = true;

    _fadeController.forward();

    await Future.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;
    _slideController.forward();

    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    _startTypewriter();

    await Future.delayed(const Duration(milliseconds: 1500));
    if (!mounted) return;
    _bounceController.forward();

    await Future.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;
    _iconController.forward();
  }

  void _startTypewriter() {
    if (!_typewriterController.isAnimating && mounted) {
      _typewriterController.addListener(() {
        if (!mounted) return;
        final progress = _typewriterController.value;
        final targetIndex = (progress * _fullText.length).round();
        if (targetIndex != _currentIndex) {
          setState(() {
            _currentIndex = targetIndex;
            _displayedText = _fullText.substring(0, _currentIndex);
          });
        }
      });

      _typewriterController.forward();
    }
  }

  @override
  void dispose() {
    _fadeController.stop();
    _slideController.stop();
    _typewriterController.stop();
    _bounceController.stop();
    _iconController.stop();
    _fadeController.dispose();
    _slideController.dispose();
    _typewriterController.dispose();
    _bounceController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  // دالة للحصول على الألوان حسب الثيم
  Color _getTextColor(bool isPrimary) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark
        ? (isPrimary ? Colors.white : Colors.white70)
        : (isPrimary
            ? LightThemeColors.textPrimary
            : LightThemeColors.textSecondary);
  }

  Color _getAccentColor() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? Colors.cyanAccent : LightThemeColors.primaryCyan;
  }

  Color _getCardColor() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark
        ? Colors.cyanAccent.withOpacity(0.1)
        : LightThemeColors.accentCyan.withOpacity(0.1);
  }

  Color _getBorderColor() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark
        ? Colors.cyanAccent.withOpacity(0.2)
        : LightThemeColors.borderLight;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return VisibilityDetector(
      key: const Key('portfolio-brief'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_hasStartedAnimations) {
          _startAnimations();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Animated Name
          FadeTransition(
            opacity: _fadeAnimation,
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: isDark
                    ? [Colors.cyanAccent, Colors.white, Colors.cyanAccent]
                    : [
                        LightThemeColors.primaryCyan,
                        LightThemeColors.textPrimary,
                        LightThemeColors.primaryCyan
                      ],
                stops: const [0.0, 0.5, 1.0],
              ).createShader(bounds),
              child: Text(
                "ALI MAHER",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: _getTextColor(true),
                  letterSpacing: 3,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: _getAccentColor().withOpacity(0.5),
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Animated Introduction with Typewriter Effect
          SlideTransition(
            position: _slideAnimation,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "And I'm a ",
                    style: TextStyle(
                      fontSize: 22,
                      color: _getTextColor(true),
                    ),
                  ),
                  TextSpan(
                    text: _displayedText,
                    style: TextStyle(
                      fontSize: 22,
                      color: _getAccentColor(),
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 5,
                          color: _getAccentColor().withOpacity(0.3),
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                  ),
                  // Blinking cursor
                  if (_currentIndex < _fullText.length)
                    WidgetSpan(
                      child: AnimatedBuilder(
                        animation: _typewriterController,
                        builder: (context, child) {
                          return Opacity(
                            opacity:
                                (DateTime.now().millisecondsSinceEpoch % 1000 <
                                        500)
                                    ? 1.0
                                    : 0.0,
                            child: Text(
                              "|",
                              style: TextStyle(
                                fontSize: 22,
                                color: _getAccentColor(),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Animated Description
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: _slideController,
              curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
            )),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _slideController,
                  curve: const Interval(0.3, 1.0, curve: Curves.easeIn),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      _getCardColor(),
                      Colors.transparent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                    color: _getBorderColor(),
                    width: 1,
                  ),
                  boxShadow: isDark
                      ? null
                      : [
                          BoxShadow(
                            color: LightThemeColors.shadowLight,
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                ),
                child: Text(
                  "I'm a mobile app developer with strong skills in Flutter, Dart,\n"
                  "Firebase, API integration, UI/UX, and clean architecture.\n"
                  "I have almost 2 years of experience and all my projects are\n"
                  "delivered with high quality and client satisfaction.",
                  style: TextStyle(
                    fontSize: 16,
                    color: _getTextColor(false),
                    height: 1.6,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Animated Social Icons
          ScaleTransition(
            scale: _iconAnimation,
            child: Row(
              children: [
                _buildAnimatedIcon(FontAwesomeIcons.facebook, 0,
                    url: "https://www.facebook.com/ali.maher.403247"),
                _buildAnimatedIcon(FontAwesomeIcons.linkedin, 100,
                    url: "https://www.linkedin.com/in/ali-maher-maher"),
                _buildAnimatedIcon(FontAwesomeIcons.envelope, 200,
                    url: "mailto:ali.maher0013@gmail.com?subject=Hello"),
                _buildAnimatedIcon(FontAwesomeIcons.github, 300,
                    url: "https://github.com/ALi-Maher-Mohamed"),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Animated Buttons
          ScaleTransition(
            scale: _bounceAnimation,
            child: Row(
              children: [
                _buildAnimatedButton(
                  "Download CV",
                  true,
                  () {
                    launchCustomUrl(
                      context,
                      url:
                          "https://drive.usercontent.google.com/u/0/uc?id=1BEZtQUxMaQBRdK9erGgddDhL4yTqKDOp&export=download",
                    );
                  },
                ),
                const SizedBox(width: 12),
                _buildAnimatedButton(
                  "Portfolio",
                  false,
                  () {
                    Navigator.pushNamed(context, '/projects');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedIcon(IconData icon, int delay, {required String url}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedBuilder(
      animation: _iconController,
      builder: (context, child) {
        final delayedAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(
          parent: _iconController,
          curve: Interval(
            delay / 1000.0,
            (delay + 300) / 1000.0,
            curve: Curves.elasticOut,
          ),
        ));
        return Transform.scale(
          scale: delayedAnimation.value,
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  isDark
                      ? Colors.cyanAccent.withOpacity(0.2)
                      : LightThemeColors.primaryCyan.withOpacity(0.2),
                  Colors.transparent,
                ],
              ),
              boxShadow: isDark
                  ? null
                  : [
                      BoxShadow(
                        color: LightThemeColors.shadowLight,
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
            ),
            child: IconButton(
              icon: Icon(icon),
              color: _getAccentColor(),
              iconSize: 24,
              onPressed: () {
                HapticFeedback.lightImpact();
                launchCustomUrl(context, url: url);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedButton(
      String text, bool isPrimary, VoidCallback onPressed) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    bool _isHovered = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: isPrimary
                    ? (isDark
                        ? (_isHovered
                            ? Colors.cyanAccent.withOpacity(0.8)
                            : Colors.cyanAccent)
                        : (_isHovered
                            ? LightThemeColors.buttonHover
                            : LightThemeColors.buttonPrimary))
                    : Colors.transparent,
                foregroundColor: isPrimary
                    ? (isDark ? Colors.black : LightThemeColors.textOnPrimary)
                    : _getAccentColor(),
                side: isPrimary
                    ? null
                    : BorderSide(
                        color: _isHovered
                            ? _getAccentColor().withOpacity(0.8)
                            : _getAccentColor(),
                        width: 2,
                      ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: isPrimary ? (_isHovered ? 12 : 8) : 0,
                shadowColor: _getAccentColor().withOpacity(0.5),
              ),
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

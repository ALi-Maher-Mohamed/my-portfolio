import 'package:Ali_Maher/core/constant/launch_url.dart';
import 'package:Ali_Maher/core/constant/theme.dart';
import 'package:Ali_Maher/presentation/widgets/shared_hexagon_image.dart';
import 'package:Ali_Maher/presentation/widgets/shared_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.onScrollToIndex,
  });
  final Function onScrollToIndex;
  final double screenHeight;
  final double screenWidth;

  @override
  State<MainMobile> createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _typewriterController;
  late AnimationController _bounceController;
  late AnimationController _iconController;

  late Animation<double> _fadeAnimation;
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

    _fadeController = MainShared.createFadeController(this);
    _slideController = MainShared.createSlideController(this);
    _typewriterController = MainShared.createTypewriterController(this);
    _bounceController = MainShared.createBounceController(this);
    _iconController = MainShared.createIconController(this);

    _fadeAnimation = MainShared.createFadeAnimation(_fadeController);
    _bounceAnimation = MainShared.createBounceAnimation(_bounceController);
    _iconAnimation = MainShared.createIconAnimation(_iconController);
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return VisibilityDetector(
      key: const Key('main-mobile'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_hasStartedAnimations) {
          _startAnimations();
        }
      },
      child: Expanded(
        child: Container(
          height: widget.screenHeight,
          constraints: const BoxConstraints(minHeight: 350),
          padding: EdgeInsets.symmetric(
              horizontal: widget.screenWidth * 0.05, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HexagonAnimatedImage(),
              // const SizedBox(height: 24),
              FadeTransition(
                opacity: _fadeAnimation,
                child: ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: isLightMode
                        ? [
                            LightThemeColors.primaryCyan,
                            LightThemeColors.textPrimary,
                            LightThemeColors.primaryCyan
                          ]
                        : [Colors.cyan, Colors.white, Colors.cyan],
                    stops: const [0.0, 0.5, 1.0],
                  ).createShader(bounds),
                  child: Text(
                    "ALI MAHER",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: MainShared.getTextColor(isLightMode, true),
                      letterSpacing: 2,
                      shadows: [
                        Shadow(
                          blurRadius: 8,
                          color: MainShared.getAccentColor(isLightMode)
                              .withOpacity(0.4),
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // const SizedBox(height: 12),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.5),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: _slideController,
                  curve: Curves.easeOut,
                )),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "And I'm a ",
                        style: TextStyle(
                          fontSize: 20,
                          color: MainShared.getTextColor(isLightMode, true),
                        ),
                      ),
                      TextSpan(
                        text: _displayedText,
                        style: TextStyle(
                          fontSize: 20,
                          color: MainShared.getAccentColor(isLightMode),
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 4,
                              color: MainShared.getAccentColor(isLightMode)
                                  .withOpacity(0.3),
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                      if (_currentIndex < _fullText.length)
                        WidgetSpan(
                          child: AnimatedBuilder(
                            animation: _typewriterController,
                            builder: (context, child) {
                              return Opacity(
                                opacity:
                                    (DateTime.now().millisecondsSinceEpoch %
                                                1000 <
                                            500)
                                        ? 1.0
                                        : 0.0,
                                child: Text(
                                  "|",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        MainShared.getAccentColor(isLightMode),
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
              // const SizedBox(height: 16),
              ScaleTransition(
                scale: _iconAnimation,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: MainShared.getSocialIcons(isLightMode)
                      .asMap()
                      .entries
                      .map((entry) {
                    final index = entry.key;
                    final iconData = entry.value;
                    return _buildAnimatedIcon(
                      iconData['icon'] as IconData,
                      index * 100,
                      url: iconData['url'],
                      isLightMode: isLightMode,
                    );
                  }).toList(),
                ),
              ),
              // const SizedBox(height: 20),
              ScaleTransition(
                scale: _bounceAnimation,
                child: _buildAnimatedButton(
                  "Get In Touch",
                  true,
                  () {
                    HapticFeedback.lightImpact();
                    widget.onScrollToIndex(5);
                  },
                  isLightMode,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedIcon(IconData icon, int delay,
      {required String url, required bool isLightMode}) {
    return AnimatedBuilder(
      animation: _iconController,
      builder: (context, child) {
        final delayedAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _iconController,
            curve: Interval(
              delay / 1000.0,
              (delay + 300) / 1000.0,
              curve: Curves.elasticOut,
            ),
          ),
        );
        return Transform.scale(
          scale: delayedAnimation.value,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  MainShared.getAccentColor(isLightMode).withOpacity(0.15),
                  Colors.transparent,
                ],
              ),
              boxShadow: isLightMode
                  ? [
                      BoxShadow(
                        color: LightThemeColors.shadowLight.withOpacity(0.3),
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ]
                  : null,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  launchCustomUrl(context, url: url);
                  HapticFeedback.lightImpact();
                },
                child: Icon(
                  icon,
                  color: MainShared.getAccentColor(isLightMode),
                  size: 24,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedButton(
      String text, bool isPrimary, VoidCallback onPressed, bool isLightMode) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary
            ? MainShared.getAccentColor(isLightMode)
            : Colors.transparent,
        foregroundColor: isPrimary
            ? (isLightMode ? LightThemeColors.textOnPrimary : Colors.white)
            : MainShared.getAccentColor(isLightMode),
        side: isPrimary
            ? null
            : BorderSide(
                color: MainShared.getAccentColor(isLightMode),
                width: 1.5,
              ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        elevation: isPrimary ? 6 : 0,
        shadowColor: MainShared.getAccentColor(isLightMode).withOpacity(0.4),
        minimumSize: const Size(180, 48),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}

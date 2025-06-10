import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimatedPortfolioBrief extends StatefulWidget {
  const AnimatedPortfolioBrief({super.key});

  @override
  _AnimatedPortfolioBriefState createState() => _AnimatedPortfolioBriefState();
}

class _AnimatedPortfolioBriefState extends State<AnimatedPortfolioBrief>
    with TickerProviderStateMixin {
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

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );

    _typewriterController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    _bounceController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    _iconController = AnimationController(
      duration: Duration(milliseconds: 1500),
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
      begin: Offset(-1.0, 0.0),
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

    // Start animations
    _startAnimations();
  }

  void _startAnimations() async {
    // Fade in the name
    _fadeController.forward();

    // Wait a bit, then slide in the description
    await Future.delayed(Duration(milliseconds: 300));
    _slideController.forward();

    // Start typewriter effect for Flutter Developer
    await Future.delayed(Duration(milliseconds: 600));
    _startTypewriter();

    // Bounce buttons
    await Future.delayed(Duration(milliseconds: 1500));
    _bounceController.forward();

    // Animate icons
    await Future.delayed(Duration(milliseconds: 300));
    _iconController.forward();
  }

  void _startTypewriter() {
    _typewriterController.addListener(() {
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

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _typewriterController.dispose();
    _bounceController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Animated Name
        FadeTransition(
          opacity: _fadeAnimation,
          child: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.cyanAccent, Colors.white, Colors.cyanAccent],
              stops: [0.0, 0.5, 1.0],
            ).createShader(bounds),
            child: Text(
              "ALI MAHER",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 3,
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: Colors.cyanAccent.withOpacity(0.5),
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(height: 8),

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
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: _displayedText,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.cyanAccent,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 5,
                        color: Colors.cyanAccent.withOpacity(0.3),
                        offset: Offset(0, 0),
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
                              color: Colors.cyanAccent,
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

        SizedBox(height: 16),

        // Animated Description
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: _slideController,
            curve: Interval(0.3, 1.0, curve: Curves.easeOut),
          )),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: _slideController,
                curve: Interval(0.3, 1.0, curve: Curves.easeIn),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Colors.cyanAccent.withOpacity(0.1),
                    Colors.transparent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: Colors.cyanAccent.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Text(
                "I'm a mobile app developer with strong skills in Flutter, Dart,\n"
                "Firebase, API integration, UI/UX, and clean architecture.\n"
                "I have almost 2 years of experience and all my projects are\n"
                "delivered with high quality and client satisfaction.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  height: 1.6,
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 24),

        // Animated Social Icons
        ScaleTransition(
          scale: _iconAnimation,
          child: Row(
            children: [
              _buildAnimatedIcon(Icons.facebook, 0),
              _buildAnimatedIcon(Icons.link, 100),
              _buildAnimatedIcon(Icons.mail, 200),
              _buildAnimatedIcon(Icons.code, 300),
            ],
          ),
        ),

        SizedBox(height: 20),

        // Animated Buttons
        ScaleTransition(
          scale: _bounceAnimation,
          child: Row(
            children: [
              _buildAnimatedButton(
                "Download CV",
                true,
                () {},
              ),
              SizedBox(width: 12),
              _buildAnimatedButton(
                "Portfolio",
                false,
                () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedIcon(IconData icon, int delay) {
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
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.cyanAccent.withOpacity(0.2),
                  Colors.transparent
                ],
              ),
            ),
            child: IconButton(
              icon: Icon(icon),
              color: Colors.cyanAccent,
              iconSize: 24,
              onPressed: () {
                // Add haptic feedback
                HapticFeedback.lightImpact();
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedButton(
      String text, bool isPrimary, VoidCallback onPressed) {
    return MouseRegion(
      onEnter: (_) {},
      onExit: (_) {},
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isPrimary ? Colors.cyanAccent : Colors.transparent,
            foregroundColor: isPrimary ? Colors.black : Colors.cyanAccent,
            side: isPrimary
                ? null
                : BorderSide(color: Colors.cyanAccent, width: 2),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: isPrimary ? 8 : 0,
            shadowColor: Colors.cyanAccent.withOpacity(0.5),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

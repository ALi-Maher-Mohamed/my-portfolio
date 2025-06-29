import 'package:Ali_Maher/core/constant/colors.dart';
import 'package:flutter/material.dart';

class ThemeToggleSwitch extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onToggle;
  final double width;
  final double height;

  const ThemeToggleSwitch({
    Key? key,
    required this.isDarkMode,
    required this.onToggle,
    this.width = 80,
    this.height = 40,
  }) : super(key: key);

  @override
  State<ThemeToggleSwitch> createState() => _ThemeToggleSwitchState();
}

class _ThemeToggleSwitchState extends State<ThemeToggleSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    if (widget.isDarkMode) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(ThemeToggleSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isDarkMode != oldWidget.isDarkMode) {
      if (widget.isDarkMode) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onToggle(!widget.isDarkMode),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.height / 2),
              gradient: LinearGradient(
                colors: widget.isDarkMode
                    ? [
                        const Color(0xFF2C3E50),
                        const Color(0xFF34495E),
                      ]
                    : [
                        LightThemeColors.primaryCyan,
                        LightThemeColors.primaryCyanLight,
                      ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.isDarkMode
                      ? Colors.black.withOpacity(0.2)
                      : LightThemeColors.shadowLight,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Icons background
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Sun icon
                      Opacity(
                        opacity: widget.isDarkMode ? 0.3 : 1.0,
                        child: Icon(
                          Icons.wb_sunny,
                          color: LightThemeColors.textOnPrimary,
                          size: widget.height * 0.5,
                        ),
                      ),
                      // Moon icon
                      Opacity(
                        opacity: widget.isDarkMode ? 1.0 : 0.3,
                        child: Icon(
                          Icons.nightlight_round,
                          color: LightThemeColors.textOnPrimary,
                          size: widget.height * 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                // Moving circle
                AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  alignment: widget.isDarkMode
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: widget.height - 4,
                    height: widget.height - 4,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: LightThemeColors.textOnPrimary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: widget.isDarkMode
                              ? Colors.black.withOpacity(0.3)
                              : LightThemeColors.shadowLight,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      widget.isDarkMode
                          ? Icons.nightlight_round
                          : Icons.wb_sunny,
                      color: widget.isDarkMode
                          ? const Color(0xFF2C3E50)
                          : LightThemeColors.primaryCyan,
                      size: widget.height * 0.4,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillsSectionWeb extends StatelessWidget {
  const SkillsSectionWeb({super.key});

  Widget buildSkill({
    required String imagePath,
    required String skillName,
    required double level,
    required int index,
  }) {
    return _HoverAnimatedSkill(
      index: index,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: ClipOval(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skillName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Stack(
                    children: [
                      Container(
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: level / 100,
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.cyanAccent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${level.toInt()}%',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<List<dynamic>> skillsData = [
      ['assets/icons/flutter.png', 'Flutter', 85.0],
      ['assets/icons/dart.png', 'Dart', 80.0],
      ['assets/icons/firebase.png', 'Firebase', 70.0],
      ['assets/icons/icons8-git-48.png', 'Git', 75.0],
      ['assets/icons/figma.png', 'Figma', 90.0],
      ['assets/icons/photoshop.png', 'Adobe Photoshop', 65.0],
      ['assets/icons/illustrator.png', 'Adobe Illustrator', 70.0],
      ['assets/icons/icons8-html-48.png', 'HTML - 5', 90.0],
    ];

    return Container(
      width: double.infinity,
      color: const Color(0xFF1F1F28),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "My ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                  ),
                ),
                TextSpan(
                  text: "Skills",
                  style: TextStyle(
                    color: Colors.cyanAccent,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 700) {
                final half = (skillsData.length / 2).ceil();
                final firstHalf = skillsData.sublist(0, half);
                final secondHalf = skillsData.sublist(half);

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(firstHalf.length, (index) {
                        final data = firstHalf[index];
                        return buildSkill(
                          imagePath: data[0],
                          skillName: data[1],
                          level: data[2],
                          index: index,
                        );
                      }),
                    ),
                    const SizedBox(width: 60),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(secondHalf.length, (index) {
                        final data = secondHalf[index];
                        return buildSkill(
                          imagePath: data[0],
                          skillName: data[1],
                          level: data[2],
                          index: index + half,
                        );
                      }),
                    ),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(skillsData.length, (index) {
                    final data = skillsData[index];
                    return buildSkill(
                      imagePath: data[0],
                      skillName: data[1],
                      level: data[2],
                      index: index,
                    );
                  }),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _HoverAnimatedSkill extends StatefulWidget {
  final Widget child;
  final int index;

  const _HoverAnimatedSkill(
      {required this.child, required this.index, Key? key})
      : super(key: key);

  @override
  State<_HoverAnimatedSkill> createState() => _HoverAnimatedSkillState();
}

class _HoverAnimatedSkillState extends State<_HoverAnimatedSkill> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedScale(
        scale: _hovering ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: widget.child
            .animate(delay: Duration(milliseconds: 100 * widget.index))
            .fadeIn(duration: const Duration(milliseconds: 400))
            .slideX(begin: 0.3, end: 0.0, curve: Curves.easeOut),
      ),
    );
  }
}

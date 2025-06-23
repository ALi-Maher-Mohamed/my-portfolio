import 'package:flutter/material.dart';

class MyProjectsWeb extends StatefulWidget {
  const MyProjectsWeb({super.key});

  @override
  State<MyProjectsWeb> createState() => _MyProjectsWebState();
}

class _MyProjectsWebState extends State<MyProjectsWeb>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  int? _hoveredIndex;

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

    _scaleController = AnimationController(
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
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.elasticOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.bounceOut,
    ));

    // Start animations
    Future.delayed(const Duration(milliseconds: 300), () {
      _fadeController.forward();
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      _slideController.forward();
    });

    Future.delayed(const Duration(milliseconds: 700), () {
      _scaleController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1A1A2E),
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // مهم: عشان ياخد المساحة الي محتاجها بس
        children: [
          // Title Animation
          FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -0.5),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: _slideController,
                curve: Curves.easeOutBack,
              )),
              child: Container(
                margin: const EdgeInsets.only(bottom: 60),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'My ',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Portfolio',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00D4FF),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Portfolio Grid - بدون Expanded
          SlideTransition(
            position: _slideAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // حساب العرض المتاح
                  double availableWidth = constraints.maxWidth;

                  // حساب عرض كل كارد (3 كاردز + 2 مسافات)
                  double cardWidth =
                      (availableWidth - 40) / 3; // 40 = 2 × 20 spacing
                  double cardHeight = cardWidth / 1.4; // aspect ratio 1.4

                  // حساب الارتفاع الكلي (2 صفوف + مسافة بينهم)
                  double totalHeight =
                      (cardHeight * 2) + 20; // 20 = spacing between rows

                  return SizedBox(
                    height: totalHeight,
                    child: GridView.builder(
                      physics:
                          const NeverScrollableScrollPhysics(), // منع السكرول
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.4,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return _buildPortfolioCard(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioCard(int index) {
    final portfolioItems = [
      {
        'title': 'Web Design',
        'image': 'assets/web_design.jpg',
        'category': 'Design',
        'isHighlighted': index == 0,
      },
      {
        'title': 'Mobile App',
        'image': 'assets/mobile_app.jpg',
        'category': 'Development',
        'isHighlighted': false,
      },
      {
        'title': 'Gaming Setup',
        'image': 'assets/gaming_setup.jpg',
        'category': 'Hardware',
        'isHighlighted': false,
      },
      {
        'title': 'Workspace',
        'image': 'assets/workspace.jpg',
        'category': 'Environment',
        'isHighlighted': false,
      },
      {
        'title': 'Accessories',
        'image': 'assets/accessories.jpg',
        'category': 'Hardware',
        'isHighlighted': false,
      },
      {
        'title': 'Keyboard',
        'image': 'assets/keyboard.jpg',
        'category': 'Hardware',
        'isHighlighted': false,
      },
    ];

    final item = portfolioItems[index];
    final isHovered = _hoveredIndex == index;
    final isHighlighted = item['isHighlighted'] as bool;

    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 600 + (index * 100)),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: MouseRegion(
            onEnter: (_) {
              setState(() {
                _hoveredIndex = index;
              });
            },
            onExit: (_) {
              setState(() {
                _hoveredIndex = null;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: isHovered || isHighlighted
                    ? [
                        BoxShadow(
                          color: const Color(0xFF00D4FF).withOpacity(0.4),
                          blurRadius: 25,
                          spreadRadius: 2,
                          offset: const Offset(0, 8),
                        ),
                        BoxShadow(
                          color: const Color(0xFF00D4FF).withOpacity(0.2),
                          blurRadius: 40,
                          spreadRadius: 5,
                          offset: const Offset(0, 15),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: const Offset(0, 4),
                        ),
                      ],
                border: Border.all(
                  color: isHighlighted
                      ? const Color(0xFF00D4FF)
                      : Colors.transparent,
                  width: isHighlighted ? 2 : 0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: isHighlighted
                          ? [
                              const Color(0xFF00D4FF).withOpacity(0.8),
                              const Color(0xFF0EA5E9).withOpacity(0.6),
                              const Color(0xFF1E293B).withOpacity(0.9),
                            ]
                          : [
                              const Color(0xFF374151).withOpacity(0.8),
                              const Color(0xFF1F2937).withOpacity(0.9),
                              const Color(0xFF111827),
                            ],
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        // Handle portfolio item tap
                        print('Portfolio item ${index} tapped');
                      },
                      child: Stack(
                        children: [
                          // Background pattern or placeholder
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: RadialGradient(
                                  center: Alignment.center,
                                  radius: 1.0,
                                  colors: [
                                    Colors.white.withOpacity(0.1),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Content
                          Positioned.fill(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Icon or placeholder for image
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: isHighlighted
                                          ? Colors.white.withOpacity(0.2)
                                          : const Color(0xFF00D4FF)
                                              .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      _getIconForIndex(index),
                                      size: 30,
                                      color: isHighlighted
                                          ? Colors.white
                                          : const Color(0xFF00D4FF),
                                    ),
                                  ),

                                  const SizedBox(height: 15),

                                  // Title
                                  Text(
                                    item['title'] as String,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: isHighlighted
                                          ? Colors.white
                                          : const Color(0xFF00D4FF),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),

                                  const SizedBox(height: 8),

                                  // Category
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isHighlighted
                                          ? Colors.white.withOpacity(0.2)
                                          : const Color(0xFF00D4FF)
                                              .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      item['category'] as String,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: isHighlighted
                                            ? Colors.white.withOpacity(0.8)
                                            : const Color(0xFF00D4FF)
                                                .withOpacity(0.8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Hover overlay
                          if (isHovered)
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      const Color(0xFF00D4FF).withOpacity(0.1),
                                      const Color(0xFF0EA5E9).withOpacity(0.2),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
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

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.web;
      case 1:
        return Icons.phone_android;
      case 2:
        return Icons.sports_esports;
      case 3:
        return Icons.desktop_mac;
      case 4:
        return Icons.mouse;
      case 5:
        return Icons.keyboard;
      default:
        return Icons.code;
    }
  }
}

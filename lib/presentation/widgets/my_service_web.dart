import 'package:Ali_Maher/core/constant/colors.dart';
import 'package:flutter/material.dart';

class MyServicesWeb extends StatefulWidget {
  const MyServicesWeb({super.key});

  @override
  State<MyServicesWeb> createState() => _MyServicesWebState();
}

class _MyServicesWebState extends State<MyServicesWeb>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  int? _selectedIndex;
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 1.0);

  final List<Map<String, String>> services = [
    {
      'title': 'Software Engineering',
      'description':
          'As a software engineering student and developer, I apply clean code principles, version control (Git), and agile methodologies in my projects. I understand both frontend and backend logic, and I work effectively with REST APIs, local storage, and scalable app structures.',
    },
    {
      'title': 'Mobile App Development',
      'description':
          'I develop modern and efficient cross-platform mobile applications using Flutter and Dart. With over 10 apps built, ranging from creative personal ideas to real-world projects, I focus on clean architecture, state management (Cubit/BLoC), Firebase integration, and responsive UI/UX.',
    },
    {
      'title': 'Technical Instructor & Mentor',
      'description':
          'With real experience teaching at iSchool, GDSC, and GDG communities, I deliver engaging and practical sessions on programming fundamentals, Flutter development, and software concepts. I’ve trained students online and offline, helping beginners turn ideas into real projects.',
    },
    {
      'title': 'Sales & Digital Marketing',
      'description':
          'With over 5 years of sales experience, I understand how to connect with customers and communicate value clearly. I also have hands-on experience with digital marketing strategies and content creation for tech and educational campaigns.',
    },
    {
      'title': 'UI/UX Consulting',
      'description':
          'I help individuals and teams design better user experiences by analyzing UI flow, usability, accessibility, and consistency. I give actionable feedback based on UX principles, especially for mobile apps and web platforms.',
    },
    {
      'title': 'Mentorship for Beginners',
      'description':
          'I provide mentorship for beginners in programming, helping them set learning paths, solve bugs, understand core concepts, and build confidence through small, progressive tasks.',
    },
  ];

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
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
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
                  text: TextSpan(
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
                        text: 'Services',
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

          // Services Section with Navigation
          Expanded(
            child: SlideTransition(
              position: _slideAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Stack(
                  children: [
                    // PageView for cards
                    PageView.builder(
                      controller: _pageController,
                      itemCount: (services.length / 3).ceil(),
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, pageIndex) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (index) {
                              final serviceIndex = pageIndex * 3 + index;
                              if (serviceIndex < services.length) {
                                return Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: _buildServiceCard(serviceIndex),
                                  ),
                                );
                              } else {
                                return Expanded(child: Container());
                              }
                            },
                          ),
                        );
                      },
                    ),

                    // Navigation Arrows
                    if (services.length > 3) ...[
                      // Left Arrow
                      if (_currentPage > 0)
                        Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_left,
                              size: 40,
                              color: Color(0xFF00D4FF),
                            ),
                            onPressed: () {
                              _pageController.previousPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),

                      // Right Arrow
                      if (_currentPage < (services.length / 3).ceil() - 1)
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_right,
                              size: 40,
                              color: Color(0xFF00D4FF),
                            ),
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                    ],
                  ],
                ),
              ),
            ),
          ),

          // Page Indicators
          if (services.length > 3)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  (services.length / 3).ceil(),
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: _currentPage == index ? 12 : 8,
                    height: _currentPage == index ? 12 : 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? Color(0xFF00D4FF)
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(int index) {
    final service = services[index];
    final isHighlighted = _selectedIndex == index;

    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 600 + (index % 3 * 200)),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * value),
          child: Container(
            decoration: BoxDecoration(
              color: CustomColors.scaffold1,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: isHighlighted
                    ? const Color(0xFF00D4FF)
                    : Colors.transparent,
                width: 1,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  height: 500,
                  constraints: const BoxConstraints(
                    minHeight: 260,
                    maxHeight: 600,
                    minWidth: 260,
                    maxWidth: 350,
                  ),
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Title
                      Text(
                        service['title'] as String,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: isHighlighted
                              ? const Color(0xFF00D4FF)
                              : Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 20),

                      // Description
                      Text(
                        service['description'] as String,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 30),
                      // Button
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle hire me button
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isHighlighted
                                ? const Color(0xFF00D4FF)
                                : Colors.white,
                            foregroundColor: isHighlighted
                                ? Colors.white
                                : const Color(0xFF4A5568),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            isHighlighted ? 'HIRE ME' : 'Hire Me',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
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
        );
      },
    );
  }
}

// Extension لإضافة تأثيرات إضافية
extension AnimatedServiceCard on Widget {
  Widget addHoverEffect() {
    return MouseRegion(
      onEnter: (_) {},
      onExit: (_) {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: this,
      ),
    );
  }
}

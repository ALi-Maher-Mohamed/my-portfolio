const List<Map<String, String>> services = [
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

double getHorizontalPadding(double screenWidth) {
  if (screenWidth > 1400) return 80;
  if (screenWidth > 1200) return 60;
  if (screenWidth > 900) return 40;
  return 20;
}

double getVerticalPadding(double screenWidth) {
  if (screenWidth > 1200) return 80;
  if (screenWidth > 900) return 60;
  return 40;
}

double getSectionSpacing(double screenWidth) {
  if (screenWidth > 1200) return 40;
  if (screenWidth > 900) return 30;
  return 20;
}

double getTitleFontSize(double screenWidth) {
  if (screenWidth > 1400) return 56;
  if (screenWidth > 1200) return 48;
  if (screenWidth > 900) return 42;
  return 36;
}

double getUnderlineWidth(double screenWidth) {
  if (screenWidth > 1200) return 100;
  if (screenWidth > 900) return 80;
  return 60;
}

double getCardHeight(double screenWidth) {
  if (screenWidth > 1200) return 450;
  if (screenWidth > 900) return 400;
  return 350;
}

double getAxisSpacing(double screenWidth) {
  if (screenWidth > 1200) return 20;
  if (screenWidth > 900) return 15;
  return 10;
}

double getSkillFontSize(double screenWidth) {
  if (screenWidth > 1200) return 16;
  if (screenWidth > 900) return 14;
  return 12;
}

double getSkillPadding(double screenWidth) {
  if (screenWidth > 1200) return 16;
  if (screenWidth > 900) return 12;
  return 10;
}

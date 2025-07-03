const List<List<dynamic>> skillsData = [
  ['assets/icons/flutter.png', 'Flutter', 85.0],
  ['assets/icons/dart.png', 'Dart', 90.0],
  ['assets/icons/firebase.png', 'Firebase', 70.0],
  ['assets/icons/icons8-git-48.png', 'Git', 85.0],
  ['assets/icons/figma.png', 'Figma', 90.0],
  ['assets/icons/python.png', 'Python', 90.0],
  ['assets/icons/c-.png', 'C++', 80.0],
  ['assets/icons/php.png', 'PHP', 60.0],
  ['assets/icons/hierarchy_structure.png', 'Data Structure', 80.0],
  ['assets/icons/programming.png', 'OOP', 80.0],
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

double getContentSpacing(double screenWidth) {
  if (screenWidth > 1400) return 120;
  if (screenWidth > 1200) return 100;
  if (screenWidth > 900) return 80;
  return 60;
}

double getSkillWidth(double screenWidth) {
  if (screenWidth > 1400) return 500;
  if (screenWidth > 1200) return 450;
  if (screenWidth > 900) return 400;
  return double.infinity;
}

double getImageSize(double screenWidth) {
  if (screenWidth > 1200) return 50;
  if (screenWidth > 900) return 45;
  return 40;
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

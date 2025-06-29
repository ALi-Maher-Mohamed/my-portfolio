import 'package:Ali_Maher/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ali Maher',
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomeView(
        onThemeChanged: (value) {
          setState(() {
            isDarkMode = value;
          });
        },
        isDarkMode: isDarkMode,
      ),
    );
  }
}

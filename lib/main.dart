import 'package:Ali_Maher/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://diakdbefpfsyxfqfdsxv.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRpYWtkYmVmcGZzeXhmcWZkc3h2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTY0ODA3NjIsImV4cCI6MjA3MjA1Njc2Mn0.HIWthH8_K8BlmxdenX2ymLGXZkt9I65sS12yV3GzuNA',
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeAnimationCurve: Curves.easeInOut,
      useInheritedMediaQuery: true,
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

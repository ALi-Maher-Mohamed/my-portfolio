import 'package:Ali_Maher/presentation/views/home_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(), // Wrap your app
    ),
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
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
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

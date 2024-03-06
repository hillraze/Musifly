import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/onboarding/onboarding_screen.dart';
import 'pages/splash/splash_screen.dart';
import 'pages/homepage/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: onboarding_screen_page(),
      theme: ThemeData(
        fontFamily: 'Poppins',
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ButtonStyle(
        //     textStyle: MaterialStatePropertyAll<TextStyle>(
        //         TextStyle(fontFamily: 'Poppins')),
        //   ),
      ),
    );
    // );
  }
}

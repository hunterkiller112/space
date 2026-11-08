import 'package:flutter/material.dart';

import 'screens/details_screen.dart';
import 'screens/home_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const SpaceApp());
}

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Space',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0E0E0E),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFEE403D),
          surface: Color(0xFF0E0E0E),
        ),
      ),
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        DetailsScreen.routeName: (context) => const DetailsScreen(),
      },
    );
  }
}

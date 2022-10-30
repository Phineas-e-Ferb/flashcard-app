import 'package:flashcard/screens/feedback.dart';
import 'package:flashcard/screens/home.dart';
import 'package:flashcard/screens/signin.dart';
import 'package:flashcard/screens/signup.dart';
import 'package:flashcard/screens/welcome.dart';
import 'package:flutter/material.dart';

class MaterialSetEnv {
  static ThemeData setThemeData() => ThemeData(
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
        fontFamily: 'Inter',
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Color(0xFFBB86FC),
          onPrimary: Colors.white,
          secondary: Color(0xFF9379C2),
          onSecondary: Colors.white,
          error: Color(0xFFFC8686),
          onError: Colors.white,
          background: Color(0xFF121212),
          onBackground: Color(0xFFE1E1E1),
          surface: Color(0xFF1E1E1E),
          onSurface: Color(0xFFC2C2C2),
        ),
      );

  static Map<String, Widget Function(BuildContext)> setRoutes() => {
        "/": (context) => const WelcomeScreen(),
        "/signin": (context) => const SignInScreen(),
        "/signup": (context) => const SignUpScreen(),
        "/feedback": (context) => const FeedbackScreen(),
        "/home": (context) => const HomeScreen()
      };
}

import 'package:flashcard/screens/feedback.dart';
import 'package:flashcard/screens/home.dart';
import 'package:flashcard/screens/signin.dart';
import 'package:flashcard/screens/signup.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    "/": (context) => const HomeScreen(),
    "/signin": (context) => const SignInScreen(),
    "/signup": (context) => const SignUpScreen(),
    "/feedback": (context) => const FeedbackScreen()
  };
}

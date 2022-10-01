import 'package:flashcard/screens/home.dart';
import 'package:flashcard/utils/custom_theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getCustomThemeData(),
      home: const HomeScreen(),
    );
  }
}

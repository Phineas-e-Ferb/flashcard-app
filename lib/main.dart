import 'package:flashcard/utils/custom_theme_data.dart';
import 'package:flashcard/utils/get_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashcard App',
      theme: getCustomThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: getRoutes(),
    );
  }
}

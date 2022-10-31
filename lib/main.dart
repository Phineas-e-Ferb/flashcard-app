import 'package:flashcard/services/api.dart';
import 'package:flashcard/services/user_service.dart';
import 'package:flashcard/utils/material_env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  late UserService userService;
  late Api apiService;

  dotenv.load(fileName: ".env").then(
        (_) => {
          userService = UserService(),
          apiService = Api(),
          runApp(
            MultiProvider(
              providers: [
                ChangeNotifierProvider.value(value: apiService),
                ChangeNotifierProvider.value(value: userService),
              ],
              child: const MyApp(),
            ),
          )
        },
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashcard App',
      theme: MaterialSetEnv.setThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: MaterialSetEnv.setRoutes(),
    );
  }
}

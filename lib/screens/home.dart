import 'dart:convert';

import 'package:flashcard/models/user.dart';
import 'package:flashcard/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserService userService;
  Future? getUser;
  User? user;

  @override
  void initState() {
    userService = context.read<UserService>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getUser ??= userService.getUserById('${userService.userId}');

    return FutureBuilder(
      future: getUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          user = snapshot.data;

          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Theme.of(context).colorScheme.background,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: userService.handleSignOut,
                    icon: const Icon(
                      Icons.logout,
                      size: 24,
                    ),
                  ),
                ],
                title: Row(
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: MemoryImage(base64Decode(user!.image)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Olá,", style: TextStyle(fontSize: 18)),
                        Text(
                          user?.username ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
        }
        return Center(
          child: Column(
            children: const [
              CircularProgressIndicator(),
              Text('Carregando...'),
            ],
          ),
        );
      },
    );
  }
}

import 'dart:convert';

import 'package:flashcard/models/user.dart';
import 'package:flashcard/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  User? user;

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  void getUserData() async {
    var pref = await SharedPreferences.getInstance();
    int? userId = pref.getInt("user_id");
    User userInfo = await UserService().getUserById(userId.toString());
    setState(() {
      user = userInfo;
      isLoading = false;
    });
  }

  void handleSignOut() async {
    var pref = await SharedPreferences.getInstance();
    await pref.remove("user_id");
    Navigator.pushReplacementNamed(context, "/");
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).colorScheme.background,
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: handleSignOut,
                    icon: const Icon(
                      Icons.logout,
                      size: 24,
                    ))
              ],
              title: Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: MemoryImage(
                            base64Decode(user!.image),
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Olá,", style: TextStyle(fontSize: 18)),
                      Text(
                        user!.username,
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
  }
}

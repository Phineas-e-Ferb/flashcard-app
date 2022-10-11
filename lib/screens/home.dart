import 'dart:convert';

import 'package:flashcard/services/flashcard_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? userId;
  String? photo;
  bool isLoading = true;

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  void getUserData() async {
    var pref = await SharedPreferences.getInstance();
    userId = pref.getInt("user_id");
    var userInfo =
        await FlashCardService().getRequest("users/", args: userId.toString());
    setState(() {
      photo = userInfo["image"];
      isLoading = false;
    });
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
                    onPressed: () => {},
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
                            base64Decode(photo!),
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Olá,", style: TextStyle(fontSize: 18)),
                      Text(
                        "FONE",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}

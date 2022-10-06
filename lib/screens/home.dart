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
    print(userInfo);
    setState(() {
      photo = userInfo["image"];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Image.memory(
              base64Decode(photo!),
            ),
    );
  }
}

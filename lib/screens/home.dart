import 'dart:convert';

import 'package:flutter/material.dart';

class HomeScreenArguments {
  final String photo;

  HomeScreenArguments(this.photo);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as HomeScreenArguments;
    return Scaffold(
      appBar: AppBar(),
      body: Image.memory(
        base64Decode(args.photo),
      ),
    );
  }
}

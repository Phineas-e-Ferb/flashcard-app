import 'package:flutter/material.dart';

Future<void> showDefaultAlertDialog(
    String title, String message, BuildContext screenContext) {
  return showDialog(
      context: screenContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Continuar"),
            )
          ],
        );
      });
}

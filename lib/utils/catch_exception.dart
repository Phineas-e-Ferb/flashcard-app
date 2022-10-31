import 'package:flutter/material.dart';

class ResponseException implements Exception {
  Map error;
  late String message;
  ResponseException(this.error) {
    message = error['message'];
  }
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showError(
      BuildContext context, String error) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).cardColor,
        content: Row(
          children: [
            const Expanded(
              flex: 1,
              child: Icon(
                Icons.warning_amber,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                error,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

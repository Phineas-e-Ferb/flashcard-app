import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatelessWidget {
  const DefaultButtonWidget(
      {super.key,
      required this.label,
      required this.onPressed,
      this.showLoading = false});
  final String label;
  final Function onPressed;
  final bool showLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        fixedSize:
            MaterialStateProperty.resolveWith((states) => const Size(100, 48)),
        shape: MaterialStateProperty.resolveWith(
          (states) => const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      ),
      child: showLoading
          ? CircularProgressIndicator(
              color: Colors.white,
            )
          : Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}

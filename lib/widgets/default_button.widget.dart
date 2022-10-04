import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatelessWidget {
  const DefaultButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    this.showLoading = false,
    this.disableButton = true,
  });
  final String label;
  final Function onPressed;
  final bool showLoading;
  final bool disableButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disableButton ? null : () => onPressed(),
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
          ? const SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
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

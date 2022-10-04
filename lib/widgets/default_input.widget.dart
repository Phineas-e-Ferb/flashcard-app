import 'package:flutter/material.dart';

class DefaultInput extends StatelessWidget {
  const DefaultInput({
    super.key,
    required this.placeholder,
    required this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.obscureText = false,
    this.controller,
  });
  final String placeholder;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final Function? onSuffixIconPressed;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.surface),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.surface),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        fillColor: Theme.of(context).colorScheme.surface,
        filled: true,
        hintText: placeholder,
        hintStyle: const TextStyle(
          color: Color(0xFF585858),
        ),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: () => onSuffixIconPressed!(), icon: Icon(suffixIcon))
            : null,
      ),
      obscureText: obscureText,
    );
  }
}

import 'package:flutter/material.dart';

class DefaultInput extends StatelessWidget {
  const DefaultInput({
    super.key,
    required this.placeholder,
    required this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.obscureText = false,
  });
  final String placeholder;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final Function? onSuffixIconPressed;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
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

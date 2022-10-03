import 'dart:io';

import 'package:flutter/material.dart';

class ImagePickerPreviewWidget extends StatelessWidget {
  const ImagePickerPreviewWidget({super.key, required this.image});
  final File? image;
  @override
  Widget build(BuildContext context) {
    return image != null
        ? CircleAvatar(
            backgroundImage: FileImage(
              image!,
            ),
            radius: 50,
          )
        : CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            radius: 50,
            child: const Icon(
              Icons.image,
              size: 36,
            ),
          );
  }
}

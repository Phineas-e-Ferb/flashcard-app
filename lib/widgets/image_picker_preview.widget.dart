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
        : Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.all(
                Radius.circular(106),
              ),
            ),
            child: const Icon(
              Icons.image,
              size: 36,
            ),
          );
  }
}

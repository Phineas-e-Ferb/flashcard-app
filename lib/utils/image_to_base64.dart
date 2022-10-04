import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

Future<String> imageToBase64(File image) async {
  Uint8List imagebytes = await image.readAsBytes(); //convert to bytes
  String base64string =
      base64.encode(imagebytes); //convert bytes to base64 string
  return base64string;
}

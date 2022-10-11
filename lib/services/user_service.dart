import 'dart:io';

import 'package:flashcard/models/user.dart';
import 'package:flashcard/services/api.dart';
import 'package:flashcard/utils/image_to_base64.dart';

class UserService {
  Future<dynamic> signin(String username, String password) async {
    var response = await Api().postRequest(
      "login",
      body: {"username": username, "password": password},
    );
    return response;
  }

  Future<dynamic> signup(String username, String password, File image) async {
    String image64 = await imageToBase64(image);
    var response = await Api().postRequest(
      "users",
      body: {"username": username, "password": password, "image": image64},
    );
    return response;
  }

  Future<dynamic> getUserById(String userID) async {
    var response = await Api().getRequest("users", args: "/$userID");
    User user = User.fromJson(response);
    return user;
  }
}

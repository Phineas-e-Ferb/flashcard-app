import 'dart:io';

import 'package:flashcard/models/user.dart';
import 'package:flashcard/services/api.dart';
import 'package:flashcard/utils/catch_exception.dart';
import 'package:flashcard/utils/image_to_base64.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends Api {
  int? userId;

  UserService() {
    _getUserData();
  }

  void _getUserData() async {
    var pref = await SharedPreferences.getInstance();
    userId = pref.getInt("user_id");
  }

  void handleSignOut() async {
    var pref = await SharedPreferences.getInstance();
    pref.remove("user_id");
  }

  Future<dynamic> signin(String username, String password) async {
    final body = {"username": username, "password": password};

    try {
      var response = await postRequest(
        "login",
        body: body,
      );
      return response;
    } catch (error) {
      throw ResponseException(error as Map).message;
    }
  }

  Future<dynamic> signup(String username, String password, File image) async {
    String image64 = await imageToBase64(image);
    final body = {"username": username, "password": password, "image": image64};

    try {
      var response = await postRequest(
        "users",
        body: body,
      );
      return response;
    } catch (error) {
      throw ResponseException(error as Map).message;
    }
  }

  Future<dynamic> getUserById(String userID) async {
    try {
      var response = await getRequest("users", args: "/$userID");
      User user = User.fromJson(response);
      return user;
    } catch (error) {
      throw ResponseException(error as Map).message;
    }
  }
}

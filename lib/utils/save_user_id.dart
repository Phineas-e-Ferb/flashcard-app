import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserId(int userId) async {
  final pref = await SharedPreferences.getInstance();
  pref.setInt("user_id", userId);
}

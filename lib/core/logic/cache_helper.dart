import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static String token = '';
  void setToken({required String token}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString(
          "token",
        ) ??
        "";
    return token;
  }
}

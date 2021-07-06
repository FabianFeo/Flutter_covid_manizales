import 'package:shared_preferences/shared_preferences.dart';

class PreferenceToken {
  Future setToken(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', type);
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}

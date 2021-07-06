import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUser {
  Future setUser(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', type);
  }

  Future<String> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user');
  }
}

import 'package:shared_preferences/shared_preferences.dart';
class PreferenceToken {
    Future setToken(bool type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('token', type);
  }

  Future<bool> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('token'); 
  }
}
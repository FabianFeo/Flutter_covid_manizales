import 'package:shared_preferences/shared_preferences.dart';

class PreferenceLogin {
  Future typeLogin(bool type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('login', type);
  }

  Future<bool> getTypeLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('login'); 
  }
}

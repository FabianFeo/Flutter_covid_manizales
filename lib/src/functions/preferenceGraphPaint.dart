import 'package:shared_preferences/shared_preferences.dart';

class PereferencesGraphToken {
  Future setGrafoPintado(bool type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('grafopintado', type);
  }

  Future<bool> getGrafoPintado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('grafopintado'); 
  }
}

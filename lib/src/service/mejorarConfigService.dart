import 'package:shared_preferences/shared_preferences.dart';

class MejorarConfigService {
  saveMejorarConfig(bool mejorar) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('mejorar', mejorar);
  }
  Future<bool> getMejorarConfigService() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('mejorar') != null) {
      return prefs.getBool('mejorar');
    }
    bool mejorar = true;
    await saveMejorarConfig(mejorar);
    return mejorar;
  }
}
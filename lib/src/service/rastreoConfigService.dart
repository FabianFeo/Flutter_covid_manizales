import 'package:shared_preferences/shared_preferences.dart';

class RastreoConfigService {
  saveRastreoConfig(bool rastreo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('rastreo', rastreo);
  }
  Future<bool> getRastreoConfigService() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('rastreo') != null) {
      return prefs.getBool('rastreo');
    }
    bool rastreo = true;
    await saveRastreoConfig(rastreo);
    return rastreo;
  
  }
}
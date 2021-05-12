import 'package:shared_preferences/shared_preferences.dart';

class IotConfigService {
  saveIotConfig(bool iot) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('iot', iot);
  }

  Future<bool> getIotConfigService() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('iot') != null) {
      return prefs.getBool('iot');
    }
    bool iot = true;
    await saveIotConfig(iot);
    return iot;
  }
}

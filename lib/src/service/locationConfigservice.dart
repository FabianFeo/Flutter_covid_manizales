import 'package:shared_preferences/shared_preferences.dart';

class LocationConfigService {
  saveLocationConfig(bool location) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('location', location);
  }

  Future<bool> getLocationConfig() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('location') != null) {
      return prefs.getBool('location');
    }
    bool location = true;
    await saveLocationConfig(location);
    return location;
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesLocation {
  Future setLocation(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> locations = await getLocation();
    if (locations == null) {
      locations = List();
    }
    locations.add(type);
    await prefs.setStringList('locations', locations);
  }

  Future<List<String>> getLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('locations');
  }
}

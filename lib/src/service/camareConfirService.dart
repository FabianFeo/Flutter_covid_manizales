import 'package:shared_preferences/shared_preferences.dart';

class CamaraConfigService {
  saveCamaraConfig(bool camara) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('camara', camara);
  }
  Future<bool> getCamaraConfigService() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     if (prefs.getBool('camara') != null) {
      return prefs.getBool('camara');
    }
    bool camara = true;
    await saveCamaraConfig(camara);
    return camara;
  }
  }

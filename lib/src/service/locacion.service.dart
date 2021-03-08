import 'dart:async';
import 'dart:convert';
import 'package:aprendiendo/src/functions/preferencesLocation.dart';
import 'package:aprendiendo/src/functions/preferenceslogin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocactionService {
  initLocatioService() {
    Timer.periodic(Duration(seconds: 20), (timer) async {
      if (await Permission.location.request().isGranted) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        PreferencesLocation preferencesLocation = PreferencesLocation();
        preferencesLocation.setLocation(json.encode(
            {'latitud': position.latitude, 'longitud': position.longitude}));
      }
    });
  }
}

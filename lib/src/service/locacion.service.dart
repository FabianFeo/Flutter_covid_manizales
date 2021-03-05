import 'dart:async';
import 'package:geolocator/geolocator.dart';

class LocacionService {
initLocatioService() {
  Timer.periodic(Duration(seconds: 20), (timer) async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
   });
}

}



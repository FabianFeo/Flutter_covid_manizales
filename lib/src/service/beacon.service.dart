import 'dart:convert';

import 'package:aprendiendo/src/functions/PreferenceToken.dart';
import 'package:aprendiendo/src/functions/preferenceUser.dart';

import 'package:http/http.dart' as http;

class BeaconService {
  beaconPush(Map data) {
    data.forEach((key, value) async {
      PreferenceToken preferenceToken = PreferenceToken();
      PreferenceUser preferenceUser = PreferenceUser();
      String idUser =
          json.decode(await preferenceUser.getUser())['id'].toString();
      String token = await preferenceToken.getToken();
      http.Response response = await http.post(
          'https://covidalert.com.co/api/iot/beacon-session-tracking/',
          body: {
            "_from": DateTime.now().toIso8601String(),
            "beacon_id": key,
            "rssi": json.encode(value),
            "until": DateTime.now().toIso8601String(),
            "device": idUser
          },
          headers: {
            'Authorization': 'JWT ${token}'
          });
      return response;
    });
  }
}

import 'dart:convert';

import 'package:aprendiendo/src/functions/PreferenceToken.dart';
import 'package:aprendiendo/src/functions/preferenceUser.dart';

import 'package:http/http.dart' as http;

class BeaconService {
  Future<void> beaconPush(Map data) async {
    List<Map> lista = List();
    await data.forEach((key, value) async {
      PreferenceUser preferenceUser = PreferenceUser();
      String idUser =
          json.decode(await preferenceUser.getUser())['id'].toString();

      lista.add(
        {
          "_from": DateTime.now().toIso8601String(),
          "beacon_id": key,
          "rssi": json.encode(value),
          "until": DateTime.now().toIso8601String(),
          "device": idUser
        },
      );
    });
    PreferenceToken preferenceToken = PreferenceToken();
    String token = await preferenceToken.getToken();
    http.Response response = await http.post(
        'https://covidalert.com.co/api/iot/beacon-session-tracking/',
        body: lista,
        headers: {'Authorization': 'JWT ${token}'});
    return response;
  }
}

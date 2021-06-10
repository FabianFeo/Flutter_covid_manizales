import 'package:aprendiendo/src/functions/PreferenceToken.dart';
import 'package:aprendiendo/src/functions/preferenceUser.dart';
import 'package:aprendiendo/src/functions/preferenceslogin.dart';
import 'package:aprendiendo/src/model/registration.model.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class RiskService {
  Future<Map<String, dynamic>> risk() async {
    PreferenceToken preferenceToken = PreferenceToken();
    PreferenceUser preferenceUser = PreferenceUser();
    String idUser =
        json.decode(await preferenceUser.getUser())['id'].toString();
    String token = await preferenceToken.getToken();
    Map<String, dynamic> response = json.decode(json.decode((await http.get(
            'http://labs.covidalert.com.co/api/core/users/' +
                idUser +
                '/risk-status',
            headers: {'Authorization': 'JWT ${token}'}))
        .body)['data']);
    return response;
  }

  Stream<Map<String, dynamic>> streamRisk() {
    return Stream.fromFuture(risk());
  }
}
import 'dart:convert';

import 'package:aprendiendo/src/functions/PreferenceToken.dart';
import 'package:aprendiendo/src/functions/preferenceUser.dart';

import 'package:http/http.dart' as http;

class SmsService {
  registerSmsDivice() async {
    PreferenceToken preferenceToken = PreferenceToken();
    PreferenceUser preferenceUser = PreferenceUser();
    String idUser =
        json.decode(await preferenceUser.getUser())['id'].toString();
    String token = await preferenceToken.getToken();
    Map<String, dynamic> response = json.decode(json.decode((await http.post(
            'https://labs.covidalert.com.co/api/core/users/' +
                idUser +
                '/test-notifications',
            headers: {'Authorization': 'JWT ${token}'},
            body: {"type": "android", "registration_id": token}))
        .body)['data']);
  }

  pushService(String title, String body) async {
    PreferenceToken preferenceToken = PreferenceToken();
    PreferenceUser preferenceUser = PreferenceUser();
    String idUser =
        json.decode(await preferenceUser.getUser())['id'].toString();
    String token = await preferenceToken.getToken();
    Map<String, dynamic> response = json.decode(json.decode((await http.post(
            'https://labs.covidalert.com.co/api/core/users/' +
                idUser +
                '/test-notifications',
            headers: {
          'Authorization': 'JWT ${token}'
        },
            body: {
          "title": title,
          "body": body,
          "data": {"when": "today"}
        }))
        .body)['data']);
    return response;
  }
}

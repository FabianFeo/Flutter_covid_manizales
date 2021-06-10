import 'package:aprendiendo/src/functions/PreferenceToken.dart';
import 'package:aprendiendo/src/functions/preferenceUser.dart';
import 'package:aprendiendo/src/functions/preferenceslogin.dart';
import 'package:aprendiendo/src/model/registration.model.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class CovidReportService {
  Future<void> report(
      String date_test, String is_symptomatic, String date_symptom) async {
    PreferenceToken preferenceToken = PreferenceToken();
    PreferenceUser preferenceUser = PreferenceUser();
    String token = await preferenceToken.getToken();
    http.Response response =
        await http.post('https://covidalert.com.co/api/report/covid/', body: {
      "date_test": date_test,
      "is_symptomatic": is_symptomatic,
      "date_symptom": date_symptom
    }, headers: {
      'Authorization': 'JWT ${token}'
    });
  }
}

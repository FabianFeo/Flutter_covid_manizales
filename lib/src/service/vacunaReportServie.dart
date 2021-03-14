import 'package:aprendiendo/src/functions/PreferenceToken.dart';
import 'package:aprendiendo/src/functions/preferenceUser.dart';
import 'package:aprendiendo/src/functions/preferenceslogin.dart';
import 'package:aprendiendo/src/model/registration.model.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class VacunaReportService {
  report() async {
    PreferenceToken preferenceToken = PreferenceToken();
    PreferenceUser preferenceUser = PreferenceUser();
    String token = await preferenceToken.getToken();
    http.Response response =
        await http.post('http://168.176.145.73/report/covid/', body: {
      "vaccine_creator": "CureVac",
      "date_first_dose": "2021-01-09",
      "date_last_dose": "2021-02-09"
    }, headers: {
      'Authorization': 'JWT ${token}'
    });
  }
}

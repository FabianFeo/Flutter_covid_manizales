import 'package:aprendiendo/src/functions/PreferenceToken.dart';
import 'package:aprendiendo/src/functions/preferenceUser.dart';
import 'package:aprendiendo/src/functions/preferenceslogin.dart';
import 'package:aprendiendo/src/model/registration.model.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class VacunaReportService {
  Future<http.Response> report(String firstDose, String lastDosis) async {
    PreferenceToken preferenceToken = PreferenceToken();
    PreferenceUser preferenceUser = PreferenceUser();
    String token = await preferenceToken.getToken();
    http.Response response =
        await http.post('https://covidalert.com.co/api/report/vaccine/', body: {
      "vaccine_creator": "CureVac",
      "date_first_dose": firstDose,
      "date_last_dose": lastDosis
    }, headers: {
      'Authorization': 'JWT ${token}'
    });
    return response;
  }
}

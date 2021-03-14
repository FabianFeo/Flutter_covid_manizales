import 'package:aprendiendo/src/functions/PreferenceToken.dart';
import 'package:aprendiendo/src/functions/preferenceUser.dart';
import 'package:aprendiendo/src/functions/preferenceslogin.dart';
import 'package:aprendiendo/src/model/registration.model.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class RegistroService {
  PreferenceToken preferenceToken = PreferenceToken();
  PreferenceUser preferenceUser = PreferenceUser();
  Future<String> register(Registration registration) async {
    http.Response response = await http.post(
        'http://168.176.145.73/rest-auth/registration/',
        body: {
          "document_type": registration.document_type,
          "document_number": registration.document_number,
          "birth_date": registration.birth_date,
          "phone_number": registration.cellphone,
          "neighborhood": registration.neighborhood.toString()
        });
    Map<String, dynamic> body = jsonDecode(response.body);
    Map<String, dynamic> data = body['data'];
   if (body['message']=="Validation error" ) {
     return body['errors'][0]['phone_number'].toString();
   }
    preferenceToken.setToken(data['token']);
    preferenceUser.setUser(json.encode(data['user']));
    return "entro";
  }
}

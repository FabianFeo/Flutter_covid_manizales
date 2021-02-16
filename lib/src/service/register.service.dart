import 'package:aprendiendo/src/functions/PreferenceToken.dart';
import 'package:aprendiendo/src/model/registration.model.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class RegistroService {
  PreferenceToken preferenceToken=PreferenceToken();
  Future register(Registration registration) async {
    http.Response response = await http.post(
        'http://gaia.manizales.unal.edu.co:3200/rest-auth/registration/',
        body: {
          "document_type": registration.document_type,
          "document_number": registration.document_number,
          "birth_date": registration.birth_date,
          "phone_number": registration.cellphone,
          "neighborhood": registration.neighborhood
        });
    Map<String, dynamic> body = jsonDecode(response.body);
    Map<String, dynamic> data = body['data'];
    preferenceToken.setToken(data['token']);
    return data;
  }
}

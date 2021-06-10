import 'dart:convert';
import 'package:aprendiendo/src/functions/PreferenceToken.dart';
import 'package:aprendiendo/src/functions/preferenceUser.dart';
import 'package:http/http.dart' as http;

class ContactosService {
  Future<List> postContactos(List<String> listaContactos) async {
    PreferenceUser preferenceUser = PreferenceUser();
    PreferenceToken preferenceToken = PreferenceToken();
    String token = await preferenceToken.getToken();
    Map user = json.decode(await preferenceUser.getUser());
    List<Map> contacts = listaContactos.map((elemento) {
      Map e = {'phone_number_contact': elemento};
      return e;
    }).toList();
    http.Response response = await http.post(
        'https://covidalert.com.co/api/core/users/${user["id"]}/contacts/',
        body: json.encode(contacts),
        headers: {'Authorization': 'JWT ${token}'});
    Map<String, dynamic> body = jsonDecode(response.body);
    List<dynamic> data = body['data'];
    return data;
  }
}

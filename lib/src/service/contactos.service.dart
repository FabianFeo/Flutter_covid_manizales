import 'dart:convert';
import 'package:aprendiendo/src/functions/PreferenceToken.dart';
import 'package:aprendiendo/src/functions/preferenceUser.dart';
import 'package:http/http.dart' as http;

class ContactosService {
  Future<String> postContactos(List<String> listaContactos) async {
    PreferenceUser preferenceUser = PreferenceUser();
    PreferenceToken preferenceToken = PreferenceToken();
    String token = await preferenceToken.getToken();
    Map user = json.decode(await preferenceUser.getUser());
    List<Map> contacts = listaContactos.map((elemento) {
      Map e = {'phone_number_contact': elemento};
      return e;
    }).toList();
    http.Response response = await http.post(
        'https://labs.covidalert.com.co/api/core/users/${user["id"]}/contacts/',
        body: json.encode(contacts),
        headers: {'Authorization': 'JWT ${token}',"Content-Type": "application/json"});
    Map<String, dynamic> body = jsonDecode(response.body);
    String data = body['data'];
    return data;
  }

  Future<String> postContactosFuerte(List<String> listaContactos) async {
    PreferenceUser preferenceUser = PreferenceUser();
    PreferenceToken preferenceToken = PreferenceToken();
    String token = await preferenceToken.getToken();
    Map user = json.decode(await preferenceUser.getUser());
    try {
       listaContactos.map((elemento) async {
      Map e = {
        "phone_number_contact": elemento,
        "relationship": "FR",
        "strong_relationship": "True"
      };
        http.Response response = await http.post(
        'https://labs.covidalert.com.co/api/core/users/${user["id"]}/invite/',
        body: json.encode( e),
        headers: {'Authorization': 'JWT ${token}',"Content-Type": "application/json"});
    Map<String, dynamic> body = jsonDecode(response.body);
    List<dynamic> data = body['data'];
      return e;
    }).toList();
      return "data";
    } catch (e) {
      return "";
    }
  
  
  
  }
}

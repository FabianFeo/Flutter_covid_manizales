import 'dart:convert';

import 'package:http/http.dart' as http;

class ComunaService {
  Future<List> getComuna() async {
    http.Response response =
        await http.get('http://gaia.manizales.unal.edu.co:3200/geo/comunas');
    Map<String, dynamic> body = jsonDecode(response.body);
    List<dynamic> data = body['data'];
    return data;
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

class ComunaService {
  Future<List<Map<String, dynamic>>> getComuna() async {
    http.Response response =
        await http.get('http://192.168.1.45:8000/geo/comunas');
    Map<String, dynamic> body = jsonDecode(response.body);
    List<Map<String, dynamic>> data = body['data'];
    return data;
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

class ComunaService {
  Future<List> getComuna() async {
    http.Response response =
        await http.get('http://168.176.145.73/geo/comunas');
    Map<String, dynamic> body = jsonDecode(response.body);
    List<dynamic> data = body['data'];
    return data;
  }
}

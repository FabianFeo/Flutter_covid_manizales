import 'dart:convert';

import 'package:http/http.dart' as http;

class BarrioService {
  Future<List> getBarrio(String codigoBarrio) async {
    http.Response response = await http.get(
        'https://covidalert.com.co/api/geo/barrios?comuna=' +
            codigoBarrio);
    Map<String, dynamic> body = jsonDecode(response.body);
    List<dynamic> data = body['data'];
    return data;
  }
}

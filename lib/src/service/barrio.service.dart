import 'dart:convert';

import 'package:http/http.dart' as http;

class BarrioService {
  Future<List> getBarrio(String codigoBarrio) async {
    http.Response response = await http.get(
        'http://168.176.145.73/geo/barrios?comuna=' +
            codigoBarrio);
    Map<String, dynamic> body = jsonDecode(response.body);
    List<dynamic> data = body['data'];
    return data;
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;

class BarrioService {
  Future<List> getBarrio(String codigoBarrio) async {
    http.Response response = await http.get(
        'https://labs.covidalert.com.co/api/geo/barrios?comuna=' +
            codigoBarrio);
    Map<String, dynamic> body = jsonDecodeUtf8(response.body.codeUnits);
    List<dynamic> data = body['data'];
    return data;
  }
    dynamic jsonDecodeUtf8(List<int> codeUnits,
        {Object reviver(Object key, Object value)}) =>
    json.decode(utf8.decode(codeUnits), reviver: reviver);
}

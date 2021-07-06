import 'dart:convert';

import 'package:http/http.dart' as http;

class ComunaService {
  Future<List> getComuna() async {
    http.Response response =
        await http.get('https://labs.covidalert.com.co/api/geo/comunas');
    Map<String, dynamic> body = jsonDecodeUtf8(response.body.codeUnits);
    List<dynamic> data = body['data'];
    return data;
  }
 dynamic jsonDecodeUtf8(List<int> codeUnits,
        {Object reviver(Object key, Object value)}) =>
    json.decode(utf8.decode(codeUnits), reviver: reviver);
}

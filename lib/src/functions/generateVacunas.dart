import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeneratePolygons {
  Future<List<String>> createVacuna(BuildContext context) async {
    List<dynamic> lista = List();
    dynamic jsonVacunas =
        json.decode(await rootBundle.loadString("assets/jsons/vacunas.json"));
    List<dynamic> data = jsonVacunas['nombrevacuna']['numerodosis'];
    data.forEach((element) {
      lista.add(data);
    });
    return lista;
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:latlong/latlong.dart';

class GeneratePolygons {
  Future<List<TaggedPolyline>> createPolygon(BuildContext context) async {
    List<TaggedPolyline> lista = List();
    dynamic jsonPolygons = json.decode(
        await rootBundle.loadString("assets/jsons/geomapManizales.json"));
    List<dynamic> data = jsonPolygons['features'];
    data.forEach((element) {
      List<dynamic> point = element["geometry"]["coordinates"];

      
      point.forEach((element2) {
        List<LatLng> polygonsPoints = List();
        List subPoints = List();
        subPoints = element2;
        subPoints.forEach((element3) {
          polygonsPoints.add(LatLng(element3[1], element3[0]));
        });
        TaggedPolyline polygon = TaggedPolyline(
          points: polygonsPoints,
          tag: element['properties']['NOMBRES_CO'],
          strokeWidth: 3.0,
          color: Colors.red,
          borderColor: Colors.red,
          gradientColors: [Colors.red]
        );
      lista.add(polygon);

      });
      
      
    });
    return lista;
  }
}

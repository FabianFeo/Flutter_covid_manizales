import 'dart:convert';

import 'package:aprendiendo/src/functions/generatePolygons.dart';
import 'package:aprendiendo/src/view/qrScan.dart';
import 'package:aprendiendo/src/widget/BottomPermisos.dart';
import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';

import 'package:latlong/latlong.dart';

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> with TickerProviderStateMixin {
  bool _sesion = false;
  TabController _tabController;
  List<TaggedPolyline> _polygons = List();
  bool chargeMap = true;
  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    genPolygon(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Container(
        child: FloatingActionButton(
          onPressed: () => setState(() {
            _sesion = !_sesion;
          }),
          child: GestureDetector(
            child: Icon(
              Icons.qr_code_rounded,
              color: Colors.grey,
            ),
            onTap:()=> Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => QrScan()),
                            ),
          ),
          backgroundColor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: height / 10),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11),
                child: Text('I N I C I O',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Laca Light',
                        fontSize: 20)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(30),
                child: Text(
                  'Bienvenido al Sistema de Alertas Tempranas XXXX, un proyecto de la Universidad Nacional de Colombia, con el que a partir de técnicas de análisis de datos se genera informacióon vital para la toma de decisiones y la prevención del COVID - 19 en Manizales.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Divider(),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(30),
                child: Text(
                  'Tendencia del comportamiento de contagio por comunas',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
              chargeMap
                  ? CircularProgressIndicator()
                  : Container(
                      height: height / 2,
                      width: width,
                      child: FlutterMap(
                        options: new MapOptions(
                          center: new LatLng(5.067, -75.517),
                          zoom: 13.0,
                          plugins: [
                            TappablePolylineMapPlugin(),
                          ],
                        ),
                        layers: [
                       
                          new TappablePolylineLayerOptions(
                              polylineCulling: true,
                              polylines: _polygons,
                              onTap: (TaggedPolyline polyline) =>
                                  print(polyline.tag),
                              onMiss: () => print("No polyline tapped"))
                        ],
                      ),
                    ),
              Divider(),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                child: Text(
                  'Conoce la probabilidad de contagios por cominas y días en el menú "Contagios por comunas y días"',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                child: Text(
                  'O explora la probabilidad de contagio con tu red de contactos en el menú " mi red de contactos", para esta opción debes ingresar tus datos personales.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  genPolygon(BuildContext context) {
    GeneratePolygons generatePolygons = GeneratePolygons();
    generatePolygons.createPolygon(context).then((lista) {
      setState(() {
        this._polygons = lista;
        chargeMap = false;
      });
    });
  }
}

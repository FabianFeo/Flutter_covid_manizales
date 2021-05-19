import 'dart:convert';
import 'package:custom_switch/custom_switch.dart';
import 'package:date_time_picker/date_time_picker.dart' as dt;

import 'package:aprendiendo/src/functions/generatePolygons.dart';
import 'package:aprendiendo/src/view/Contagios.dart';
import 'package:aprendiendo/src/view/qrScan.dart';
import 'package:aprendiendo/src/widget/BottomPermisos.dart';
import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';

import 'package:hexcolor/hexcolor.dart';

import 'package:latlong/latlong.dart';

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> with TickerProviderStateMixin {
  String nivel = 'Bajo';
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
      backgroundColor: HexColor('#DDE9ED'),
      floatingActionButton: Container(
        child: FloatingActionButton(
          onPressed: () => setState(() {
            _sesion = !_sesion;
          }),
          child: GestureDetector(
            child: Image.asset('assets/Imagenes_assetspng/qr/qr.png'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QrScan()),
            ),
          ),
          backgroundColor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: height / 1200),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Container(
                color: HexColor('#698596'),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                      margin: EdgeInsets.only(left: width / 13),
                      width: width / 2,
                      child: Text(
                        'Control global de permisos',
                        style: TextStyle(
                          color: HexColor('#103E68'),
                          fontFamily: 'Roboto-Bold',
                          fontSize: 18),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: width / 15),
                        width: width / 5,
                        child: CustomSwitch(
                          activeColor: HexColor('#103E68'),
                          value: true,
                          onChanged: (bool position) {
                          },
                        )),
                  ],
                ),
              ),
              
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text('Inicio',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 24)),
              ),
              Container(
                    height: height / 20,
                    width: width / 1.1,
                    margin: EdgeInsets.only(top: height / 30),
                    
                    child: Center(
                      child: Row(
                        children: [
                          Container(
                            child: CustomPaint(
                              painter: ColorSelector(nivel),
                            ),
                          ),
                        ],
                      ),
                    )),
              
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(30),
                child: Text(
                  'Bienvenido al Sistema de Alertas Tempranas Covidalert, un proyecto de la Universidad Nacional de Colombia, con el que a partir de técnicas de análisis de datos se genera información vital para la toma de decisiones y la prevención del COVID-19 en Manizales. ',
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
             
             
              Divider(
                color: HexColor('#49657A'),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                child: Text(
                    'Conoce la probabilidad de contagios por cominas y días en el menú "Contagios por comunas y días"',
                    style: TextStyle(
                      color: HexColor('#49657A'),
                      fontFamily: 'Roboto-Light',
                      fontSize: 16,
                    )),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Text(
                  'O explora la probabilidad de contagio con tu red de contactos en el menú " mi red de contactos", para esta opción debes ingresar tus datos personales.',
                  style: TextStyle(
                    color: HexColor('#49657A'),
                    fontFamily: 'Roboto-Light',
                    fontSize: 16,
                  ),
                ),
              )
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

class ColorSelector extends CustomPainter {
  String nivel;

  ColorSelector(this.nivel);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 4.0
      ..color = nivel == 'Bajo' ? HexColor('#85C40C') : Colors.grey;
    final paint2 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 4.0
      ..color = nivel == 'Medio' ? HexColor('#FBB03B') : Colors.grey;
    final paint3 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 4.0
      ..color = nivel == 'Alto' ? HexColor('#ED1C24') : Colors.grey;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(0, -15, 80, 35), Radius.circular(50)),
      paint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(120, -15, 80, 35), Radius.circular(50)),
      paint2,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(240, -15, 80, 35), Radius.circular(50)),
      paint3,
    );
    canvas.drawLine(Offset(80, 0), Offset(100, 0), paint);
    canvas.drawLine(Offset(100, 0), Offset(120, 0), paint2);
    canvas.drawLine(Offset(200, 0), Offset(220, 0), paint2);
    canvas.drawLine(Offset(220, 0), Offset(240, 0), paint3);
    TextSpan span =
        new TextSpan(style: new TextStyle(color: Colors.white), text: 'Bajo');
    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, new Offset(25, -5));
    TextSpan span2 =
        new TextSpan(style: new TextStyle(color: Colors.white), text: 'Medio');
    TextPainter tp2 = new TextPainter(
        text: span2,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp2.layout();
    tp2.paint(canvas, new Offset(140, -5));
    TextSpan span3 =
        new TextSpan(style: new TextStyle(color: Colors.white), text: 'Alto');
    TextPainter tp3 = new TextPainter(
        text: span3,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp3.layout();
    tp3.paint(canvas, new Offset(267, -5));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}


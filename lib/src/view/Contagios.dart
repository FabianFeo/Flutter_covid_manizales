import 'package:aprendiendo/src/functions/generatePolygons.dart';
import 'package:aprendiendo/src/view/qrScan.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:latlong/latlong.dart';

class Contagios extends StatefulWidget {
  Contagios({Key key}) : super(key: key);

  @override
  _ContagiosState createState() => _ContagiosState();
}

class _ContagiosState extends State<Contagios> with TickerProviderStateMixin {
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
        backgroundColor: HexColor('#D0EAE5'),
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
                        )))),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: height / 40),
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: width / 11),
                  child: Text('Contagios por',
                      style: TextStyle(
                          color: HexColor('#103E68'),
                          fontFamily: 'Roboto-Bold',
                          fontSize: 24)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: width / 11),
                  child: Text('Barrios y días',
                      style: TextStyle(
                          color: HexColor('#103E68'),
                          fontFamily: 'Roboto-Bold',
                          fontSize: 24)),
                ),
                Container(
                    height: height / 10,
                    width: width / 1.1,
                    margin: EdgeInsets.only(top: height / 30),
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 40, vertical: height / 30),
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
                    'Aquí podrás observar la similitud en el comportamiento de contagios por comunas para los próximos días, desliza con tu dedo en el indicador de fecha hacia arriba o hacia abajo para ver la probabilidad de un día en específico.',
                    style: TextStyle(
                        color: HexColor('#49657A'),
                        fontFamily: 'Roboto-Light',
                        fontSize: 16),
                  ),
                ),
                chargeMap
                    ? CircularProgressIndicator()
                    : Container(
                      color: Colors.white,
                        height: height / 3,
                        width: width,
                        child: FlutterMap(
                          options: new MapOptions(
                            interactive: false,
                            center: new LatLng(5.067, -75.489),
                            zoom: 12.0,
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
              ],
            ),
          ),
        ));
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
          Rect.fromLTWH(20, -15, 80, 35), Radius.circular(50)),
      paint,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(140, -15, 80, 35), Radius.circular(50)),
      paint2,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(260, -15, 80, 35), Radius.circular(50)),
      paint3,
    );
    canvas.drawLine(Offset(100, 0), Offset(120, 0), paint);
    canvas.drawLine(Offset(120, 0), Offset(140, 0), paint2);
    canvas.drawLine(Offset(220, 0), Offset(240, 0), paint2);
    canvas.drawLine(Offset(240, 0), Offset(260, 0), paint3);
    TextSpan span =
        new TextSpan(style: new TextStyle(color: Colors.white), text: 'Bajo');
    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();
    tp.paint(canvas, new Offset(45, -5));
    TextSpan span2 =
        new TextSpan(style: new TextStyle(color: Colors.white), text: 'Medio');
    TextPainter tp2 = new TextPainter(
        text: span2,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp2.layout();
    tp2.paint(canvas, new Offset(160, -5));
    TextSpan span3 =
        new TextSpan(style: new TextStyle(color: Colors.white), text: 'Alto');
    TextPainter tp3 = new TextPainter(
        text: span3,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp3.layout();
    tp3.paint(canvas, new Offset(287, -5));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

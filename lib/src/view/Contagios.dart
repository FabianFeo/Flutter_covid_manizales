import 'package:aprendiendo/src/functions/generatePolygons.dart';
import 'package:aprendiendo/src/view/qrScan.dart';
import 'package:date_time_picker/date_time_picker.dart' as dt;

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
  double _currentSliderValue = 0;
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
                  child: Text('Comunas y días',
                      style: TextStyle(
                          color: HexColor('#103E68'),
                          fontFamily: 'Roboto-Bold',
                          fontSize: 24)),
                ),
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
                            zoom: width / 31,
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
                Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: 14,
                  divisions: 14,
                  label: getLabelSlider(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
                Container(
                  width: width,
                  height: height / 10,
                )
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

  getLabelSlider() {
    DateTime dateTime = DateTime.now();
    dateTime = dateTime.subtract(Duration(days: _currentSliderValue.toInt()));
    return dt.DateFormat('dd/MM').format(dateTime);
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

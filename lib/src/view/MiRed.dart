import 'package:aprendiendo/src/functions/generatePolygons.dart';
import 'package:aprendiendo/src/view/Compartir.dart';
import 'package:aprendiendo/src/view/Contactos.dart';
import 'package:aprendiendo/src/view/grapho.dart';
import 'package:aprendiendo/src/view/qrScan.dart';
import 'package:aprendiendo/src/widget/BottomPermisos.dart';
import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tappable_polyline/flutter_map_tappable_polyline.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:latlong/latlong.dart';

class MiRed extends StatefulWidget {
  MiRed({Key key}) : super(key: key);

  @override
  _MiRedState createState() => _MiRedState();
}

class _MiRedState extends State<MiRed> with TickerProviderStateMixin {
  bool _sesion = false;
  TabController _tabController;
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
                  child: Text('Mi red de',
                      style: TextStyle(
                          color: HexColor('#103E68'),
                          fontFamily: 'Roboto-Bold',
                          fontSize: 24)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: width / 11),
                  child: Text('Contactos',
                      style: TextStyle(
                          color: HexColor('#103E68'),
                          fontFamily: 'Roboto-Bold',
                          fontSize: 24)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(30),
                  child: Text(
                    'Aquí podrás observar el comportamiento del virus dentro de tu red de contactos, sabrás cuantos de tus contactos inscritos en la App, han sido diagnosticados y cál es tu riesgo de contagio',
                    style: TextStyle(
                        color: HexColor('#49657A'),
                        fontSize: 16,
                        fontFamily: 'Roboto-Light'),
                  ),
                ),
                Container(
                  child: Center(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(
                        'Nota de privacidad: Recuerda que los datos dispuestos a continuación solo pueden ser visualizados por ti y no tienen fines comerciales',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: HexColor('#103E68')),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: HexColor('#D0EAE5')),
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  width: width,
                  color: Colors.white,
                  child: Grafo(),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(50),
                  child: Text(
                      'Probabilidad de contagio según lugares visitados',
                      style: TextStyle(
                          color: HexColor('#103E68'),
                          fontSize: 18,
                          fontFamily: 'Roboto-Bold')),
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
                            zoom: width/31,
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
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(30),
                    child: Text(
                      '*Solo puedes visualizar la información de tus contactos que también usan COVIDALERT app. Invita a otros a usarla.',
                      style: TextStyle(
                          color: HexColor('#49657A'),
                          fontFamily: 'Roboto-Light',
                          fontSize: 14),
                    )),
                    
                Container(
                  child: Center(
                    child: BouncingWidget(
                        duration: Duration(milliseconds: 100),
                        scaleFactor: 2,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Compartir()));
                        },
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            color: HexColor('#103E68'),
                            child: Container(
                                width: width / 2,
                                height: height / 20,
                                child: Center(
                                  child: Text(
                                    "Compártela",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Roboto-Medium',
                                      fontSize: 20,
                                    ),
                                  ),
                                )))),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  List<TaggedPolyline> _polygons = List();
  bool chargeMap = true;
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

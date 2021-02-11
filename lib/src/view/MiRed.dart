import 'package:aprendiendo/src/widget/BottomPermisos.dart';
import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            child: Icon(
              Icons.qr_code_rounded,
              color: Colors.grey,
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
                  child: Text('M I  R E D  D E',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Laca Light',
                          fontSize: 20)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: width / 11),
                  child: Text('C O N T A C T O S',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Laca Light',
                          fontSize: 20)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(30),
                  child: Text(
                    'Aquí podrás observar el comportamiento del virus dentro de tu red de contactos, sabrás cuantos de tus contactos inscritos en la App, han sido diagnosticados y cál es tu riesgo de contagio',
                    style: TextStyle(
                      color: Colors.grey),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    'Nota de privacidad: Recuerda que los datos dispuestos a continuación solo pueden ser visualizados por ti y no tienen fines comerciales',
                    style: TextStyle(
                      color: Colors.grey[850]),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), 
                    color: Colors.grey[200]
                  ),
                ),
                Image(
                  image: AssetImage('assets/Marca_png/grafo.png'),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(50),
                  child: Text(
                      'Probabilidad de contagio según lugares visitados',
                      style: TextStyle(color: Colors.grey[600], fontSize: 20)),
                ),
                Image(
                  image: AssetImage('assets/Marca_png/mapa_manizales_barra.png'),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(30),
                    child: Text(
                      '*Solo puedes visualizar la información de tus contactos que también usan COVIDALERT app. Invita a otros a usarla.',
                      style: TextStyle(color: Colors.grey),
                    )),
                BouncingWidget(
                    duration: Duration(milliseconds: 100),
                    scaleFactor: 1.5,
                    onPressed: () {},
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.grey,
                        child: Container(
                          width: width / 1.5,
                          child: Text(
                            "Compártela",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ))),
              ],
            ),
          ),
        ));
  }
}

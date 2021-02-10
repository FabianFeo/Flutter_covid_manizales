import 'package:aprendiendo/src/widget/BottomPermisos.dart';
import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InicioSinRegistro extends StatefulWidget {
  InicioSinRegistro({Key key}) : super(key: key);

  @override
  _InicioSinRegistroState createState() => _InicioSinRegistroState();
}

class _InicioSinRegistroState extends State<InicioSinRegistro>
    with TickerProviderStateMixin {
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
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                child: Text(
                  '______________________________________________',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(30),
                child: Text(
                  '¿Qué puedes hacer?',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
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
                margin: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                child: Text(
                  'O explora la probabilidad de contagio con tu red de contactos en el menú " mi red de contactos", para esta opción debes ingresar tus datos personales.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Text(
                  'Ayúdanos a fortalecer nuestro sistema para proveer información cada vez más precisa',
                  textAlign: TextAlign.center,
                ),),
                BouncingWidget(
                  duration: Duration(milliseconds: 100),
                  scaleFactor: 1.5,
                  onPressed: () {
                    
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.grey,
                      child: Container(
                        width: width / 1.5,
                        child: Text(
                          "Invita a tus contactos",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

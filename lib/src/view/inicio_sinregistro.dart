import 'package:aprendiendo/src/view/Contactos.dart';
import 'package:aprendiendo/src/view/qrScan.dart';
import 'package:aprendiendo/src/widget/BottomPermisos.dart';
import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:permission_handler/permission_handler.dart';

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
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11),
                child: Text('Inicio',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 24)),
              ),
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
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(30),
                child: Text(
                  '¿Qué puedes hacer?',
                  style: TextStyle(
                    color: HexColor('#103E68'),
                    fontSize: 24,
                    fontFamily: 'Roboto-Bold',
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                child: Text(
                  'Conoce la probabilidad de contagios por cominas y días en el menú "Contagios por comunas y días"',
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                child: Text(
                    'O explora la probabilidad de contagio con tu red de contactos en el menú " mi red de contactos", para esta opción debes ingresar tus datos personales.',
                    style: TextStyle(
                        color: HexColor('#49657A'),
                        fontSize: 16,
                        fontFamily: 'Roboto-Light')),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Text(
                    'Ayúdanos a fortalecer nuestro sistema para proveer información cada vez más precisa',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontSize: 16,
                        fontFamily: 'Roboto-Bold')),
              ),
              BouncingWidget(
                  duration: Duration(milliseconds: 100),
                  scaleFactor: 1.5,
                  onPressed: () async {
                    final PermissionStatus permissionStatus =
                        await _getPermission();
                    if (permissionStatus == PermissionStatus.granted) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Contactos(
                                    permisos: true,
                                  )));
                    }
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
                            "Invita a tus contactos",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto-Medium',
                                fontSize: 16),
                          ),
                        )),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ??
          PermissionStatus.undetermined;
    } else {
      return permission;
    }
  }
}

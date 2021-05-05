import 'package:aprendiendo/src/functions/preferenceslogin.dart';
import 'package:aprendiendo/src/view/Carga.dart';
import 'package:aprendiendo/src/view/Contactos.dart';
import 'package:aprendiendo/src/view/Contagios.dart';
import 'package:aprendiendo/src/view/ControlPermisos.dart';
import 'package:aprendiendo/src/view/MiRed.dart';
import 'package:aprendiendo/src/view/ReportarContagio.dart';
import 'package:aprendiendo/src/view/Vacuna.dart';
import 'package:aprendiendo/src/view/inicio.dart';
import 'package:aprendiendo/src/view/inicio_sinregistro.dart';
import 'package:aprendiendo/src/view/login.dart';
import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:permission_handler/permission_handler.dart';

class Index extends StatefulWidget {
  Index({Key key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

/// This is the private State class that goes with NavBar.
class _IndexState extends State<Index> {
  PreferenceLogin _preferenceLogin = PreferenceLogin();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions;

  List<bool> estados;
  @override
  void initState() {
    super.initState();
    estados = List();
    estados.add(true);
    estados.add(false);
    estados.add(false);
    estados.add(false);
    estados.add(false);
  }

  void _onItemTapped(int index) {
    setState(() {
      for (var i = 0; i < estados.length; i++) {
        estados[i] = false;
      }
      estados[index] = true;
      _selectedIndex = index;
    });
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _preferenceLogin.getTypeLogin(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        _widgetOptions = <Widget>[
          snapshot.data ? Inicio() : InicioSinRegistro(),
          Contagios(),
          MiRed(),
          ReportarContagio(),
          ReportarVacuna(),
        ];
        return Scaffold(
            endDrawerEnableOpenDragGesture: true,
            key: _scaffoldKey,
            backgroundColor: HexColor('#103E68'),
            appBar: NavBar(
              scaffoldKey: _scaffoldKey,
            ),
            endDrawer: Container(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 9),
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 3.8),
              width: MediaQuery.of(context).size.width / 1.6,
              height: MediaQuery.of(context).size.height,
              child: Drawer(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ControlPermisos()),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Divider(),
                            Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width / 30),
                              child: Text(
                                'Control de permisos',
                                style: TextStyle(
                                  fontFamily: 'Roboto-Medium',
                                  color: HexColor('#103E68'),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width / 30),
                              child: Text(
                                'Preguntas frecuentes',
                                style: TextStyle(
                                  fontFamily: 'Roboto-Medium',
                                  color: HexColor('#103E68'),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width / 30),
                              child: Text(
                                'Política de tratamiento de datos',
                                style: TextStyle(
                                  fontFamily: 'Roboto-Medium',
                                  color: HexColor('#103E68'),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width / 30),
                              child: Text(
                                'Aclaraciones de privacidad',
                                style: TextStyle(
                                  fontFamily: 'Roboto-Medium',
                                  color: HexColor('#103E68'),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width / 30),
                              child: Text(
                                'Preguntas frecuentes',
                                style: TextStyle(
                                  fontFamily: 'Roboto-Medium',
                                  color: HexColor('#103E68'),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width / 30),
                              child: Text(
                                'Sobre Covidalert',
                                style: TextStyle(
                                  fontFamily: 'Roboto-Medium',
                                  color: HexColor('#103E68'),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width / 30),
                              child: Text(
                                'Ayúdanos con más datos',
                                style: TextStyle(
                                  fontFamily: 'Roboto-Medium',
                                  color: HexColor('#103E68'),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Permission.contacts
                            .request()
                            .then((elem) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Contactos(permisos: elem.isGranted)),
                                )),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width / 30),
                              child: Text(
                                'Invita a tus contactos',
                                style: TextStyle(
                                  fontFamily: 'Roboto-Medium',
                                  color: HexColor('#103E68'),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width / 30),
                              child: Text(
                                'Ir al portal web',
                                style: TextStyle(
                                  fontFamily: 'Roboto-Medium',
                                  color: HexColor('#103E68'),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: new Container(
                height: MediaQuery.of(context).size.height / 9,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: HexColor('#103E68'),
                    ),
                    child: BottomNavigationBar(
                      showUnselectedLabels: true,
                      unselectedItemColor: HexColor('#698596'),
                      selectedIconTheme:
                          IconThemeData(color: HexColor('#D0EAE5')),
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Column(
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/Imagenes_assetspng/íconos/inicio_off.png',
                                  height: 30,
                                  color: estados[0]
                                      ? HexColor('#D0EAE5')
                                      : HexColor('#698596'),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 6,
                                child: Text(
                                  'Inicio',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 70,
                                    color: estados[0]
                                        ? HexColor('#D0EAE5')
                                        : HexColor('#698596'),
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: Column(
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/Imagenes_assetspng/íconos/contagio_comunas_off.png',
                                  height: 30,
                                  color: estados[1]
                                      ? HexColor('#D0EAE5')
                                      : HexColor('#698596'),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 6,
                                child: Text(
                                  'Contagios por comunas y días',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 70,
                                    color: estados[1]
                                        ? HexColor('#D0EAE5')
                                        : HexColor('#698596'),
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: Column(
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/Imagenes_assetspng/íconos/red_contactos_off.png',
                                  height: 30,
                                  color: estados[2]
                                      ? HexColor('#D0EAE5')
                                      : HexColor('#698596'),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 6,
                                child: Text(
                                  'Mi red de contactos',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 70,
                                    color: estados[2]
                                        ? HexColor('#D0EAE5')
                                        : HexColor('#698596'),
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: Column(
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/Imagenes_assetspng/íconos/reportar_off.png',
                                  height: 30,
                                  color: estados[3]
                                      ? HexColor('#D0EAE5')
                                      : HexColor('#698596'),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 6,
                                child: Text(
                                  'Reportar contagio Covid',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 70,
                                    color: estados[3]
                                        ? HexColor('#D0EAE5')
                                        : HexColor('#698596'),
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: Column(
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/Imagenes_assetspng/íconos/vacuna_off.png',
                                  height: 30,
                                  color: estados[4]
                                      ? HexColor('#D0EAE5')
                                      : HexColor('#698596'),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 6,
                                child: Text(
                                  'Reportar vacuna',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height / 70,
                                    color: estados[4]
                                        ? HexColor('#D0EAE5')
                                        : HexColor('#698596'),
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          label: '',
                        ),
                      ],
                      currentIndex: _selectedIndex,
                      selectedItemColor: HexColor('#D0EAE5'),
                      backgroundColor: HexColor('#103E68'),
                      onTap: _onItemTapped,
                    ),
                  ),
                )));
      },
    );
  }
}

import 'package:aprendiendo/src/functions/preferenceslogin.dart';
import 'package:aprendiendo/src/view/Carga.dart';
import 'package:aprendiendo/src/view/Contagios.dart';
import 'package:aprendiendo/src/view/MiRed.dart';
import 'package:aprendiendo/src/view/ReportarContagio.dart';
import 'package:aprendiendo/src/view/Vacuna.dart';
import 'package:aprendiendo/src/view/inicio.dart';
import 'package:aprendiendo/src/view/inicio_sinregistro.dart';
import 'package:aprendiendo/src/view/login.dart';
import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';


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
        estados[i]=false;
      }
      estados[index]=true;
      _selectedIndex = index;
    });
  }

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
          backgroundColor: HexColor('#103E68'),
          appBar: NavBar(),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: new Theme(
            data: Theme.of(context).copyWith(canvasColor: HexColor('#103E68'), primaryColor: HexColor('#D0EAE5')),
            child: BottomNavigationBar(
              selectedIconTheme: IconThemeData(color: HexColor('#D0EAE5')),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/Imagenes_assets_svg/iconos/inicio_off.svg', color: estados[0]? HexColor('#D0EAE5'): HexColor('#698596') ,), 
                  label: 'Inicio',
                ),
                BottomNavigationBarItem(
                  icon:  SvgPicture.asset('assets/Imagenes_assets_svg/iconos/contagio_comunas_off.svg', color: estados[0]? HexColor('#D0EAE5'): HexColor('#698596') ,),
                  label: 'Contagios por comunas y días',
                  
                ),
                BottomNavigationBarItem( 
                  
                  icon: SvgPicture.asset('assets/Imagenes_assets_svg/iconos/red_contactos_off.svg', color: estados[0]? HexColor('#D0EAE5'): HexColor('#698596') ,),
                  label: 'Mi red de contactos',
                ),
                BottomNavigationBarItem(
                  icon:SvgPicture.asset('assets/Imagenes_assets_svg/iconos/reportar_off.svg', color: estados[0]? HexColor('#D0EAE5'): HexColor('#698596') ,),
                  label: 'reportar contagio Covid',
                ),
                BottomNavigationBarItem(
                  icon:SvgPicture.asset('assets/Imagenes_assets_svg/iconos/vacuna_off.svg', color: estados[0]? HexColor('#D0EAE5'): HexColor('#698596') ,),
                  label: 'reportar vacuna',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: HexColor('#D0EAE5'),
              backgroundColor: HexColor('#103E68'),
              onTap: _onItemTapped,
            ),
          ),
        );
      },
    );
  }
}

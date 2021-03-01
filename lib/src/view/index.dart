import 'package:aprendiendo/src/functions/preferenceslogin.dart';
import 'package:aprendiendo/src/view/Carga.dart';
import 'package:aprendiendo/src/view/Contagios.dart';
import 'package:aprendiendo/src/view/MiRed.dart';
import 'package:aprendiendo/src/view/ReportarContagio.dart';
import 'package:aprendiendo/src/view/inicio.dart';
import 'package:aprendiendo/src/view/inicio_sinregistro.dart';
import 'package:aprendiendo/src/view/login.dart';
import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:flutter/material.dart';

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

  void _onItemTapped(int index) {
    setState(() {
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
        ];
        return Scaffold(
          appBar: NavBar(),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home,
                color: Colors.blue,),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.place_rounded,
                color: Colors.blue,),
                label: 'Contagios por comunas y días',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school,
                color: Colors.blue,),
                label: 'Mi red de contactos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active_rounded,
                color: Colors.blue,),
                label: 'reportar contagio Covid',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }
}

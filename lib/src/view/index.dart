import 'package:aprendiendo/src/view/Contagios.dart';
import 'package:aprendiendo/src/view/MiRed.dart';
import 'package:aprendiendo/src/view/inicio.dart';
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
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    Inicio(),
    Contagios(),
    MiRed()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place_rounded),
            label: 'Contagios por comunas y días',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Mi red de contactos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

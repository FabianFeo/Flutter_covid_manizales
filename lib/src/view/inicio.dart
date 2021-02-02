import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: NavBar(),
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
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Bíenvenido al'),
                ),
              ),
              Container(
                child: TextField(
                  style: TextStyle(
                      color: Colors.grey, fontFamily: 'Laca Semibold'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

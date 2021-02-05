import 'package:aprendiendo/src/widget/BottomPermisos.dart';
import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contagios extends StatefulWidget {
  Contagios({Key key}) : super(key: key);

  @override
  _ContagiosState createState() => _ContagiosState();
}

class _ContagiosState extends State<Contagios> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(body: SingleChildScrollView(child: Container(
      margin: EdgeInsets.only(top: height / 10),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          ButtonPermision(),
           Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11),
                child: Text('C O N T A G I O S  P O R',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Laca Light',
                        fontSize: 20)),
              ),
                            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11),
                child: Text('C O M U N A S  Y  D Í A S',
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Laca Light',
                        fontSize: 20)),
              ),
              
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(30),
                child: Text(
                  'Aquí podrás observar la similitud en el comportamiento de contagios por comunas para los próximos días, desliza con tu dedo en el indicador de fecha hacia arriba o hacia abajo para ver la probabilidad de un día en específico.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Image(
                image: AssetImage('assets/Marca_png/mapa_manizales_barra.png'),
              ),
              
        ],
      ),
    ),)
     );
  }
}
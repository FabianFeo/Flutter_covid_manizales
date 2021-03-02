import 'package:aprendiendo/src/widget/BottomPermisos.dart';
import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Contagios extends StatefulWidget {
  Contagios({Key key}) : super(key: key);

  @override
  _ContagiosState createState() => _ContagiosState();
}

class _ContagiosState extends State<Contagios> with TickerProviderStateMixin {
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
        ),),
      body: SingleChildScrollView(child: Container(
      margin: EdgeInsets.only(top: height / 10),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
           Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11),
                child: Text('Contagios por',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 24)),
              ),
                            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11),
                child: Text('Barrios y días',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 24)),
              ),
              
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(30),
                child: Text(
                  'Aquí podrás observar la similitud en el comportamiento de contagios por comunas para los próximos días, desliza con tu dedo en el indicador de fecha hacia arriba o hacia abajo para ver la probabilidad de un día en específico.',
                  style: TextStyle(color: HexColor('#49657A'),
                  fontFamily: 'Roboto-Light',
                  fontSize: 16),
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
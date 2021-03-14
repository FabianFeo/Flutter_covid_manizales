import 'package:aprendiendo/src/view/qrScan.dart';
import 'package:aprendiendo/src/widget/BottomPermisos.dart';
import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
                  child: Text('Mi red de',
                      style: TextStyle(
                          color: HexColor('#103E68'),
                          fontFamily: 'Roboto-Bold',
                          fontSize: 24)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: width / 11),
                  child: Text('Contactos',
                      style: TextStyle(
                          color: HexColor('#103E68'),
                          fontFamily: 'Roboto-Bold',
                          fontSize: 24)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(30),
                  child: Text(
                    'Aquí podrás observar el comportamiento del virus dentro de tu red de contactos, sabrás cuantos de tus contactos inscritos en la App, han sido diagnosticados y cál es tu riesgo de contagio',
                    style: TextStyle(
                        color: HexColor('#49657A'),
                        fontSize: 16,
                        fontFamily: 'Roboto-Light'),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    'Nota de privacidad: Recuerda que los datos dispuestos a continuación solo pueden ser visualizados por ti y no tienen fines comerciales',
                    style: TextStyle(color: HexColor('#103E68')),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: HexColor('#D0EAE5')),
                ),
                CustomPaint(
                  //                       <-- CustomPaint widget
                  size: Size(300, 300),
                  painter: MyPainter(),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(50),
                  child: Text(
                      'Probabilidad de contagio según lugares visitados',
                      style: TextStyle(
                          color: HexColor('#103E68'),
                          fontSize: 18,
                          fontFamily: 'Roboto-Bold')),
                ),
                Image(
                  image:
                      AssetImage('assets/Marca_png/mapa_manizales_barra.png'),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(30),
                    child: Text(
                      '*Solo puedes visualizar la información de tus contactos que también usan COVIDALERT app. Invita a otros a usarla.',
                      style: TextStyle(
                          color: HexColor('#49657A'),
                          fontFamily: 'Roboto-Light',
                          fontSize: 14),
                    )),
                BouncingWidget(
                    duration: Duration(milliseconds: 100),
                    scaleFactor: 2,
                    onPressed: () {},
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        color: HexColor('#D0EAE5'),
                        child: Container(
                          width: width / 2,
                          height: height / 20,
                          child: Text(
                            "Compártela",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: HexColor('#103E68'),
                              fontFamily: 'Roboto-Medium',
                              fontSize: 16,
                            ),
                          ),
                        ))),
              ],
            ),
          ),
        ));
  }
}

class MyPainter extends CustomPainter {
  //         <-- CustomPainter class
  List node = [
    {"id": "(838) 822-3152"},
    {"id": "(507)127-5742x82681"},
    {"id": "790-193-7788"},
    {"id": "8071863828"},
    {"id": "377-382-9014"},
    {"id": "(832)899-5296x5232"},
    {"id": "765-748-5285"},
    {"id": "(657)324-0617x53594"},
    {"id": "174-032-5438x2964"},
    {"infected": true, "id": "(795)831-0785"},
    {"id": "(496)782-6697"},
    {"id": "001-795-860-3430"},
    {"id": "4219415506"},
    {"id": "995.788.5260x28477"},
    {"id": "472.010.3963x1521"},
    {"id": "001-879-125-7247"},
    {"id": "906-188-5942x04580"},
    {"id": "(747)518-1764"},
    {"id": "+1-129-530-5650x28684"}
  ];
  List links = [
    {"weight": 3, "source": "(838) 822-3152", "target": "(507)127-5742x82681"},
    {"weight": 3, "source": "(838) 822-3152", "target": "(795)831-0785"},
    {"weight": 3, "source": "(838) 822-3152", "target": "(496)782-6697"},
    {"weight": 1, "source": "(507)127-5742x82681", "target": "790-193-7788"},
    {"weight": 3, "source": "(507)127-5742x82681", "target": "8071863828"},
    {"weight": 3, "source": "(507)127-5742x82681", "target": "377-382-9014"},
    {
      "weight": 2,
      "source": "(507)127-5742x82681",
      "target": "+1-129-530-5650x28684"
    },
    {"weight": 1, "source": "8071863828", "target": "(832)899-5296x5232"},
    {"weight": 1, "source": "8071863828", "target": "765-748-5285"},
    {"weight": 1, "source": "8071863828", "target": "(657)324-0617x53594"},
    {"weight": 1, "source": "8071863828", "target": "174-032-5438x2964"},
    {"weight": 3, "source": "8071863828", "target": "001-795-860-3430"},
    {"weight": 1, "source": "8071863828", "target": "4219415506"},
    {
      "weight": 1,
      "source": "174-032-5438x2964",
      "target": "995.788.5260x28477"
    },
    {"weight": 3, "source": "174-032-5438x2964", "target": "472.010.3963x1521"},
    {"weight": 1, "source": "174-032-5438x2964", "target": "001-879-125-7247"},
    {"weight": 1, "source": "174-032-5438x2964", "target": "(747)518-1764"},
    {"weight": 3, "source": "4219415506", "target": "906-188-5942x04580"}
  ];

  @override
  void paint(Canvas canvas, Size size) {
    //                                             <-- Insert your painting code here.
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

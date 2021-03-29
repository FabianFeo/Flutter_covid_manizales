import 'package:aprendiendo/src/view/qrScan.dart';
import 'package:aprendiendo/src/widget/BottomPermisos.dart';
import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ReportarContagio extends StatefulWidget {
  ReportarContagio({Key key}) : super(key: key);

  @override
  _ReportarContagioState createState() => _ReportarContagioState();
}

class _ReportarContagioState extends State<ReportarContagio>
    with TickerProviderStateMixin {
  bool _sesion = false;
  TabController _tabController;
  String ContagionDate;
  int selectedRadio;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;    
  }  
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });}

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
          margin: EdgeInsets.only(top: height / 10),
          alignment: Alignment.centerLeft,
          child: Column(children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: width / 18),
              child: Text('Reportar contagio por Covid-19',
                  style: TextStyle(
                      color: HexColor('#103E68'),
                      fontFamily: 'Roboto-Bold',
                      fontSize: 24)),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(30),
              child: Text(
                'Si fuiste diagnosticado positivo por Covid 19, infórmanos para actualizar la base de datos y ayudarnos a suministrar información más precisa a las personas con quienes haya podido tener contacto.',
                style: TextStyle(
                    color: HexColor('#49657A'),
                    fontFamily: 'Roboto-Light',
                    fontSize: 16),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(30),
              child: Text(
                'Al hacerlo aceptas que verifiquemos está información con las fuentes oficiales.',
                style: TextStyle(
                    color: HexColor('#49657A'),
                    fontFamily: 'Roboto-Light',
                    fontSize: 16),
              ),
            ),
             Container(
                margin: EdgeInsets.all(25),
                child: DateTimePicker(                  
                  initialValue: '',
                  firstDate: DateTime(1920),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Fecha de contagio',
                  onChanged: (val) {
                    print(val);
                    ContagionDate = val;
                  },
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) {
                    print(val);
                    ContagionDate = val;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(25),
                child: DateTimePicker(                  
                  initialValue: '',
                  firstDate: DateTime(1920),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Selecciona el día del test',
                  onChanged: (val) {
                    print(val);
                    ContagionDate = val;
                  },
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) {
                    print(val);
                    ContagionDate = val;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(25),
                child: DateTimePicker(                  
                  initialValue: '',
                  firstDate: DateTime(1920),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Indicanos cuando iniciaron los sintomas',
                  onChanged: (val) {
                    print(val);
                    ContagionDate = val;
                  },
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) {
                    print(val);
                    ContagionDate = val;
                  },
                ),
              ),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: selectedRadio,
                      activeColor: HexColor('#103E68'),
                      onChanged: (val) {
                        print("Radio $val");
                         "Sintomatico";
                        setSelectedRadio(val);
                      },
                    ),
                    Text('Sintomatico'),
                    Radio(
                      value: 2,
                      groupValue: selectedRadio,
                      activeColor: HexColor('#103E68'),
                      onChanged: (val) {
                        "Asintomatico";
                        print("Radio $val");
                        setSelectedRadio(val);
                      },
                    ),
                    Text('Asintomatico')
                  ],
                ),

            BouncingWidget(
                duration: Duration(milliseconds: 100),
                scaleFactor: 1.5,
                onPressed: () {},
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: HexColor('#D0EAE5'),
                  child: Container(
                    width: width / 1.9,
                    child: Text(
                      "Reportar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: HexColor('#103E68'),
                          fontFamily: 'Roboto-Medium',
                          fontSize: 18),
                    ),
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
    
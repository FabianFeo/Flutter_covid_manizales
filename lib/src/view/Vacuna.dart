import 'dart:convert';

import 'package:aprendiendo/src/service/vacunaReportServie.dart';
import 'package:aprendiendo/src/view/qrScan.dart';
import 'package:aprendiendo/src/widget/BottomPermisos.dart';
import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

class ReportarVacuna extends StatefulWidget {
  ReportarVacuna({Key key}) : super(key: key);

  @override
  _ReportarVacunaState createState() => _ReportarVacunaState();
}

class _ReportarVacunaState extends State<ReportarVacuna>
    with TickerProviderStateMixin {
  bool _sesion = false;
  TabController _tabController;
  String firstDose;
  String lastDose;
  String _myActivity;
  List<Map> vacunas = [
    {"nombrevacuna": "BioNTech", "numerodosis": 2},
    {"nombrevacuna": "Pfizer", "numerodosis": 2},
    {"nombrevacuna": "Janssen", "numerodosis": 1},
    {"nombrevacuna": "Oxford", "numerodosis": 2},
    {"nombrevacuna": "AstraZeneca", "numerodosis": 2},
    {"nombrevacuna": "Moderna", "numerodosis": 2},
    {"nombrevacuna": "Sinovac", "numerodosis": 2}
  ];
  List<DropdownMenuItem<String>> listaVacunas = [];
  String dropdownValue;
  bool dosDosis = false;
  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
    createVacunas();
  }

  double width;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
          margin: EdgeInsets.only(top: height / 40),
          alignment: Alignment.centerLeft,
          child: Column(children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: width / 18),
              child: Text('Reportar vacuna por Covid-19',
                  style: TextStyle(
                      color: HexColor('#103E68'),
                      fontFamily: 'Roboto-Bold',
                      fontSize: 24)),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(30),
              child: Text(
                'Si recibiste la vacuna por Covid 19, infórmanos para actualizar la base de datos y ayudarnos a suministrar información más precisa a las personas con quienes haya podido tener contacto.',
                style: TextStyle(
                    color: HexColor('#49657A'),
                    fontFamily: 'Roboto-Light',
                    fontSize: 16),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 2, left: 30, right: 30),
              child: Text(
                'Al hacerlo aceptas que verifiquemos está información con las fuentes oficiales.',
                style: TextStyle(
                    color: HexColor('#49657A'),
                    fontFamily: 'Roboto-Light',
                    fontSize: 16),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: height / 25),
                width: width / 1.2,
                height: height / 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: HexColor('#DDE9ED'),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: _myActivity,
                        icon: Container(
                            margin: EdgeInsets.only(right: width / 20),
                            child: const Icon(Icons.arrow_downward)),
                        hint: Container(
                          margin: EdgeInsets.only(left: width / 20),
                          child: Text(
                            'Marca de Vacuna',
                            style: TextStyle(
                                color: HexColor('#698596'),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 20),
                        underline: Container(
                          height: 2,
                          color: Colors.black,
                        ),
                        onChanged: (value) {
                          buscarNumeroDosis(value);
                          setState(() {
                            _myActivity = value;
                          });
                        },
                        items:
                            listaVacunas /*this.vacunas.map((e) {
                          return 
                        }).toList()*/
                        ))),
            Container(
              margin: EdgeInsets.all(25),
              child: DateTimePicker(
                initialValue: '',
                firstDate: DateTime(1920),
                lastDate: DateTime(2100),
                dateLabelText: 'Fecha primera dosis',
                onChanged: (val) {
                  print(val);
                  firstDose = val;
                },
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) {
                  print(val);
                  firstDose = val;
                },
              ),
            ),
            this.dosDosis
                ? Container(
                    margin: EdgeInsets.all(25),
                    child: DateTimePicker(
                      initialValue: '',
                      firstDate: DateTime(2021),
                      lastDate: DateTime(2100),
                      dateLabelText: 'Fecha segunda dosis',
                      onChanged: (val) {
                        print(val);
                        lastDose = val;
                      },
                      validator: (val) {
                        print(val);
                        return null;
                      },
                      onSaved: (val) {
                        print(val);
                        lastDose = val;
                      },
                    ),
                  )
                : Container(),
            BouncingWidget(
                duration: Duration(milliseconds: 100),
                scaleFactor: 1.5,
                onPressed: () {
                  VacunaReportService vacunaReportService =
                      VacunaReportService();
                  vacunaReportService
                      .report(this.firstDose, lastDose)
                      .then((value) => {
                            Fluttertoast.showToast(
                                msg: 'Reporte de vacuna creado',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1)
                          });
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
                          "Reportar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto-Medium',
                              fontSize: 20),
                        ),
                      )),
                )),
          ]),
        ),
      ),
    );
  }

  void createVacunas() {
    this.vacunas.forEach((element) {
      setState(() {
        this.listaVacunas.add(DropdownMenuItem(
              child: Container(
                child: Text(element['nombrevacuna']),
              ),
              value: element['nombrevacuna'],
            ));
      });
    });
  }

  void buscarNumeroDosis(String value) {
    Map mapa =
        this.vacunas.firstWhere((element) => element['nombrevacuna'] == value);
    if (mapa['numerodosis'] == 2) {
      setState(() {
        this.dosDosis = true;
      });
    } else {
      setState(() {
        this.dosDosis = false;
      });
    }
  }
}

class Vacuna {
  String id;
  String info;

  Vacuna({this.id, this.info});

  factory Vacuna.fromJson(Map<String, dynamic> json) {
    return Vacuna(
      id: json["nombrevacuna"],
      info: json["dosisvacuna"],
    );
  }
}

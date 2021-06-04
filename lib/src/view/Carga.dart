import 'dart:async';
import 'dart:convert';

import 'package:aprendiendo/src/beaconScanner/beacon.dart';
import 'package:aprendiendo/src/beaconScanner/flutter_blue_beacon.dart';
import 'package:aprendiendo/src/functions/PreferenceToken.dart';
import 'package:aprendiendo/src/service/beacon.service.dart';
import 'package:aprendiendo/src/service/locacion.service.dart';
import 'package:aprendiendo/src/service/login.service.dart';

import 'package:aprendiendo/src/view/index.dart';

import 'package:aprendiendo/src/view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:hexcolor/hexcolor.dart';

class Carga extends StatefulWidget {
  Carga({Key key}) : super(key: key);

  @override
  _CargaState createState() => _CargaState();
}

class _CargaState extends State<Carga> {
  BeaconService beaconService=BeaconService();

  BuildContext _buildContext;
  @override
  void initState() {
    _startScan();
    LocactionService locactionService = LocactionService();
    locactionService.initLocatioService();
    Future.delayed(Duration(seconds: 3), () {
      PreferenceToken preferenceToken = PreferenceToken();
      preferenceToken.getToken().then((value) {
        if (value != null) {
          LoginService loginService = LoginService();
          loginService.changeToken(value).then((value2) {
            Map<String, dynamic> dta = jsonDecode(value2.body);
            preferenceToken
                .setToken(dta['data']['token'])
                .then((value3) => {
                      Navigator.of(context).pop(),
                      Navigator.push(
                          _buildContext,
                          MaterialPageRoute(
                              builder: (_buildContext) => Index()))
                    })
                .catchError((error) => {
                      Navigator.push(
                          _buildContext,
                          MaterialPageRoute(
                              builder: (_buildContext) => Login()))
                    });
          }).onError((error, stackTrace) {
            Navigator.of(context).pop();
            Navigator.push(_buildContext,
                MaterialPageRoute(builder: (_buildContext) => Login()));
          });
        } else {
          Navigator.of(context).pop();
          Navigator.push(_buildContext,
              MaterialPageRoute(builder: (_buildContext) => Login()));
        }
      });
    });
    super.initState();
  }

  bool isScanning = false;
  Map<String, List<int>> listaRssiBeacons = Map();
  Map<String, Beacon> beacons = new Map();
  FlutterBlueBeacon flutterBlueBeacon = FlutterBlueBeacon.instance;
  StreamSubscription _scanSubscription;
  _startScan() {
    _scanSubscription = flutterBlueBeacon.scan().listen((data) {
      List<List<Beacon>> beacons3 = List();
      data.forEach((eleemnt) {
        beacons3.add(Beacon.fromScanResult(eleemnt));
      });
      beacons3.forEach((beacons2) {
        beacons2.forEach((beacon) {
          if (listaRssiBeacons[beacon.id] == null) {
            listaRssiBeacons[beacon.id] = new List();
            List list = listaRssiBeacons[beacon.id];
            list.add(beacon.rssi);
            listaRssiBeacons[beacon.id] = list;
            print('entro');
          } else {
            List list = listaRssiBeacons[beacon.id];
            list.add(beacon.rssi);
            listaRssiBeacons[beacon.id] = list;
            print('entro');
          }

          print('localName: ${beacon.scanResult.advertisementData.localName}');
          print(
              'manufacturerData: ${beacon.scanResult.advertisementData.manufacturerData}');
          print(
              'serviceData: ${beacon.scanResult.advertisementData.serviceData}');

          setState(() {
            beacons[beacon.id] = beacon;
          });
        });
      });
    });
    FlutterBlue.instance.isScanning.listen((value) {
      if (!value) {
        print(listaRssiBeacons);
         this.beaconService.beaconPush(listaRssiBeacons);
        FlutterBlue.instance.startScan(timeout: Duration(seconds: 20));
        listaRssiBeacons.clear();
      }
    });
   
    //((Beacon beacon) {

    setState(() {
      isScanning = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    _buildContext = context;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Image(
                image: AssetImage(
                    'assets/Imagenes_assetspng/logos/textura_apertura.png'),
                height: height / 4,
                width: width,
                alignment: Alignment.centerLeft,
              ),
              Image(
                image: AssetImage(
                    'assets/Imagenes_assetspng/logos/logo_apertura.png'),
                height: height / 7,
              ),
              Container(
                padding: EdgeInsets.all(width / 6),
                child: Text(
                  'Sistema de apoyo para alertas tempranas de posibles contagios mediante técnicas de análisis de datos',
                  style: TextStyle(
                    fontFamily: 'Roboto-Light',
                    fontSize: 14,
                    color: HexColor("#49657A"),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Image(
                image: AssetImage(
                    'assets/Imagenes_assetspng/logos/logos_apertura.png'),
                height: height / 2.7,
              )
            ],
          ),
        ),
      ),
    );
  }
}

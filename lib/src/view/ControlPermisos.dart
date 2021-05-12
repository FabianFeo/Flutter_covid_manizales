import 'package:aprendiendo/src/service/camareConfirService.dart';
import 'package:aprendiendo/src/service/iotConfigService.dart';
import 'package:aprendiendo/src/service/locationConfigservice.dart';
import 'package:aprendiendo/src/service/mejorarConfigService.dart';
import 'package:aprendiendo/src/service/rastreoConfigService.dart';
import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ControlPermisos extends StatefulWidget {
  ControlPermisos({Key key}) : super(key: key);

  @override
  _ControlPermisosState createState() => _ControlPermisosState();
}

class _ControlPermisosState extends State<ControlPermisos>
    with TickerProviderStateMixin {
  bool _sesion = false;
  bool status = false;
  TabController _tabController;
  LocationConfigService _locationConfigService = LocationConfigService();
  MejorarConfigService _mejorarConfigService = MejorarConfigService();
  RastreoConfigService _rastreoConfigService = RastreoConfigService();
  IotConfigService _iotConfigService = IotConfigService();
  CamaraConfigService _camaraConfigService = CamaraConfigService();

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
      backgroundColor: HexColor('#D0EAE5'),
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
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: height / 10),
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: width / 11),
                  child: Text(
                      'Control de permisos',
                      style: TextStyle(
                          color: HexColor('#103E68'),
                          fontFamily: 'Roboto-Bold',
                          fontSize: 24)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(30),
                  child: Text(
                    'Para un óptimo desempeño de esta App, es necesario que otorgues algunos permisos. Recuerda que usamos los datos recolectados con fines exclusivamente científicos y en ningun caso serán usados con fines comeciales ni diferentes a lo expuesto a continuacion:',
                    style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Robnoto-Light'),
                  ),
                ),
                Divider(color: HexColor('#103E68')),
                FutureBuilder(
                  future: _locationConfigService.getLocationConfig(),
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    return snapshot.data != null
                    ? Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                      margin: EdgeInsets.only(left: width / 13),
                      width: width / 2,
                      child: Text(
                        'GPS',
                        style: TextStyle(
                          color: HexColor('#103E68'),
                          fontFamily: 'Roboto-Bold',
                          fontSize: 18),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: width / 15),
                        width: width / 5,
                        child: CustomSwitch(
                          activeColor: HexColor('#103E68'),
                          value: snapshot.data,
                          onChanged: (bool position) {
                           _locationConfigService.saveLocationConfig(position);
                          },
                        )),
                  ],
                )
                :
                CircularProgressIndicator();
                  }),
                
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                  child: Text(
                    'Permite a covidalert suministrar información precisa de probabilidades y tendencias de contagio según lugares visitados. Solo tú puedes ver estos datos.',
                    style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Robnoto-Light'),
                  ),
                ),
                FutureBuilder(
                  future: _camaraConfigService.getCamaraConfigService(),
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    return snapshot.data != null
                    ? Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                      margin: EdgeInsets.only(left: width / 13),
                      width: width / 2,
                      child: Text(
                        'Camara',
                        style: TextStyle(
                          color: HexColor('#103E68'),
                          fontFamily: 'Roboto-Bold',
                          fontSize: 18),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: width / 15),
                        width: width / 5,
                        child: CustomSwitch(
                          activeColor: HexColor('#103E68'),
                          value: snapshot.data,
                          onChanged: (bool position) {
                           _camaraConfigService.saveCamaraConfig(position);
                          },
                        )),
                  ],
                )
                :
                CircularProgressIndicator();
                  }),
                
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                  child: Text(
                    'Permite tomar fotografias de códigos QR ubicados en diferentes puntos de la ciudad para que reportes lugares visitados.',
                    style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Robnoto-Light'),
                  ),
                ),
                FutureBuilder(
                  future: _iotConfigService.getIotConfigService(),
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    return snapshot.data != null
                    ? Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                      margin: EdgeInsets.only(left: width / 13),
                      width: width / 2,
                      child: Text(
                        'Dispositivo IOT',
                        style: TextStyle(
                          color: HexColor('#103E68'),
                          fontFamily: 'Roboto-Bold',
                          fontSize: 18),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: width / 15),
                        width: width / 5,
                        child: CustomSwitch(
                          activeColor: HexColor('#103E68'),
                          value: snapshot.data,
                          onChanged: (bool position) {
                           _iotConfigService.saveIotConfig(position);
                          },
                        )),
                  ],
                )
                :
                CircularProgressIndicator();
                  }),
                
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                  child: Text(
                    'Texto aqui',
                    style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Robnoto-Light'),
                  ),
                ),
                FutureBuilder(
                  future: _mejorarConfigService.getMejorarConfigService(),
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    return snapshot.data != null
                    ? Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                      margin: EdgeInsets.only(left: width / 13),
                      width: width / 2,
                      child: Text(
                        'Ayudar a mejorar el sistema',
                        style: TextStyle(
                          color: HexColor('#103E68'),
                          fontFamily: 'Roboto-Bold',
                          fontSize: 18),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: width / 15),
                        width: width / 5,
                        child: CustomSwitch(
                          activeColor: HexColor('#103E68'),
                          value: snapshot.data,
                          onChanged: (bool position) {
                           _mejorarConfigService.saveMejorarConfig(position);
                          },
                        )),
                  ],
                )
                :
                CircularProgressIndicator();
                  }),
               
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                  child: Text(
                    'Contribuir con datos para mejorar el sistema',
                    style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Robnoto-Light'),
                  ),
                ),
                FutureBuilder(
                  future: _rastreoConfigService.getRastreoConfigService(),
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    return snapshot.data != null
                    ? Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                      margin: EdgeInsets.only(left: width / 13),
                      width: width / 2,
                      child: Text(
                        'Rastreo de contactos cercanos',
                        style: TextStyle(
                          color: HexColor('#103E68'),
                          fontFamily: 'Roboto-Bold',
                          fontSize: 18),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: width / 15),
                        width: width / 5,
                        child: CustomSwitch(
                          activeColor: HexColor('#103E68'),
                          value: snapshot.data,
                          onChanged: (bool position) {
                           _rastreoConfigService.saveRastreoConfig(position);
                          },
                        )),
                  ],
                )
                :
                CircularProgressIndicator();
                  }),
                
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                  child: Text(
                    'texto aqui',
                    style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Robnoto-Light'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

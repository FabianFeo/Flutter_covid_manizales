import 'package:aprendiendo/src/view/index.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

class AclaracionesPrivacidad extends StatefulWidget {
  AclaracionesPrivacidad({Key key}) : super(key: key);

  @override
  _AclaracionesPrivacidadState createState() => _AclaracionesPrivacidadState();
}

class _AclaracionesPrivacidadState extends State<AclaracionesPrivacidad> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: HexColor('#DDE9ED'),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text('Aclaraciondes de AclaracionesPrivacidad',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 24)),
              ),
              Divider(
                color: HexColor('#49657A'),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text('Almacenamiento de datos',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'Covidalert no almacena ningún dato que pueda rastrear la identidad del usuario ni del teléfono.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'Covidalert no almacena ningún dato de geolocalización en el servidor, incluido GPS. Bajo autorización del usuario, puede almacenar, en el teléfono, los datos de ubicación con el fin de mostrar una ruta sobre el mapa de riesgo de contagio de la ciudad.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'Los datos que se guardan en el dispositivo serán eliminados en 20 días',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'Los dispositivos donde se ha registrado algún reporte positivo de Covid-19 son eliminados en 20 días',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text(
                    'Funcionalidades de consumo de información (acceso a gráficos)',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'Covidalert registra la visita a un lugar mediante un código QR, no almacena la imagen en el dispositivo y no contiene información encriptada a la ubicación, por ende no hay forma de rastrear la ubicación.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'Al activar el permiso de acceso IoT autorizas a Covidalert a registrar las interacciones con este tipo de dispositivos, tu dispositivo la registra y permite enviarte alertas de posible exposición a un contagio.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11, top: height / 40),
                child: Text('Funcionalidades de reporte',
                    style: TextStyle(
                        color: HexColor('#103E68'),
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'Cuando un contacto reporta que ha sido diagnosticado positivo por Covid-19 llega una notificación de alerta a toda la red de contactos de esta persona.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'La red de contactos se construye a través de invitaciones, rastreando contacto vía bluetooth y a través de registro de ubicaciones vía dispositivos IoT y códigos QR.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'La “red de contacto” de Covidalert es anónima, los datos mostrados en la “red de contactos” solo pueden ser visualizados por el usuario y no tienen fines comerciales.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Divider(
                color: HexColor('#49657A'),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'Covidalert utiliza bluetooth de baja energía (BLE) para rastrear contactos, la información se comparte solamente con otros teléfonos, se genera aleatoriamente y no contiene ningún dato del dispositivo ni del propietario.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'Los datos personales o sensibles de los usuarios están cifrados mediante criptografía moderna (HTTPS)//o el método que se use',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: height / 50, left: width / 15, right: width / 15),
                child: Text(
                  'Las conexiones entre la aplicación y el servidor están cifradas.(buscar una forma amigable para decirlo) ',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  child: BouncingWidget(
                      duration: Duration(milliseconds: 100),
                      scaleFactor: 1.5,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Index(),
                            ));
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: height / 25),
                          alignment: Alignment.center,
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
                                      "Registrarme",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Roboto-Medium',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ))))))
            ],
          ),
        ),
      ),
    );
  }
}

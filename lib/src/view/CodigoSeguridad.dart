import 'package:aprendiendo/src/service/login.service.dart';
import 'package:aprendiendo/src/view/index.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CodigoSeguridad extends StatefulWidget {
  final String phoneNumber;
  CodigoSeguridad({Key key, @required this.phoneNumber}) : super(key: key);

  @override
  _CodigoSeguridadState createState() => _CodigoSeguridadState();
}

class _CodigoSeguridadState extends State<CodigoSeguridad> {
  String securityCode = null;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: height / 10),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 60),
                child: Text('Introduce tu Código de Seguridad',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    )),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: width / 10, bottom: height / 12),
                child: Text(
                  'Enviaremos un código de 6 digitos a tu numero de teléfono registrado, para verificar tu identidad',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              VerificationCode(
                textStyle: TextStyle(fontSize: 20, color: Colors.grey),
                underlineColor: Colors.black,
                keyboardType: TextInputType.number,
                length: 6,
                clearAll: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    'Código de Seguridad',
                    style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: Colors.blue),
                  ),
                ),
                onCompleted: (String value) {
                  securityCode = value;
                },
                onEditing: (bool value) {},
              ),
              BouncingWidget(
                  duration: Duration(milliseconds: 100),
                  scaleFactor: 1.5,
                  onPressed: () {
                    if (securityCode == null) {
                      Fluttertoast.showToast(
                          msg: 'Por favor complete el codigo de seguridad ',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1);
                    } else {
                      LoginService loginService=LoginService();
                      loginService.loginOtp(widget.phoneNumber,securityCode).then((value){
                        if (value!=null) {
                         Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Index()));
                        }
                      });

                    }
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.grey,
                      child: Container(
                        width: width / 1.5,
                        child: Text(
                          "Verificar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

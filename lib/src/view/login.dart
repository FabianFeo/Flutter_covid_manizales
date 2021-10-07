import 'dart:io';

import 'package:aprendiendo/src/beaconBroadcast/BeanBroascast.dart';
import 'package:aprendiendo/src/functions/preferenceslogin.dart';
import 'package:aprendiendo/src/service/login.service.dart';
import 'package:aprendiendo/src/view/CodigoSeguridad.dart';
import 'package:aprendiendo/src/view/Registro.dart';
import 'package:aprendiendo/src/view/index.dart';
import 'package:aprendiendo/src/view/inicio.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool activateLogin = false;
  @override
  void initState() {
    super.initState();
    BeaconBroadcastSrvice beaconBroadcastSrvice = BeaconBroadcastSrvice();
    beaconBroadcastSrvice.beaconBroadcast();
  }

  PreferenceLogin _preferenceLogin = new PreferenceLogin();
  String phonenumber = "";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: HexColor('#DDE9ED'),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: height / 8),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: width / 3),
                padding: EdgeInsets.only(top: height / 8),
                child: Text(
                  'Inicio de sesión',
                  style: TextStyle(
                    color: HexColor('#103E68'),
                    fontFamily: 'Roboto-Bold',
                    fontSize: 24,
                  ),
                ),
              ),
              BeautyTextfield(
                width: double.maxFinite, //REQUIRED
                height: 60, //REQUIRED
                accentColor: Colors.white, // On Focus Color
                textColor: HexColor('#698596'), //Text Color
                backgroundColor: Colors.white, //Not Focused Color
                textBaseline: TextBaseline.alphabetic,
                autocorrect: false,
                autofocus: false,
                enabled: true, // Textfield enabled
                focusNode: FocusNode(),
                fontFamily: 'Roboto-Light', //Text Fontfamily
                fontWeight: FontWeight.w500,
                maxLines: 1,
                margin: EdgeInsets.all(30),
                cornerRadius: BorderRadius.all(Radius.circular(50)),
                duration: Duration(milliseconds: 300),
                inputType: TextInputType.phone, //REQUIRED
                placeholder: "Número de Teléfono",
                isShadow: true,

                prefixIcon: Icon(Icons.lock), //REQUIRED
                onClickSuffix: () {
                  print('Suffix Clicked');
                },

                onChanged: (text) {
                  setState(() {
                    activateLogin = true;
                  });
                  phonenumber = text;
                },
              ),
              BouncingWidget(
                  duration: Duration(milliseconds: 100),
                  scaleFactor: 1.5,
                  onPressed: () {
                    if (phonenumber.isNotEmpty &&activateLogin) {
                      activateLogin=false;
                      LoginService loginService = LoginService();
                      loginService.login(phonenumber, context).then((value) {
                        if (value == null) {
                          Fluttertoast.showToast(
                              msg: "Usuario no registrad@",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1);
                              activateLogin=true;
                        } else {
                          _preferenceLogin.typeLogin(true).then((value) {
                            Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CodigoSeguridad(
                                    phoneNumber: phonenumber,
                                  ),
                                ));
                          });
                        }
                      });
                    }
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: HexColor('#103E68'),
                      child: Container(
                          width: width / 2.5,
                          height: height / 15,
                          child: Center(
                            child: Text(
                              "Ingresar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Roboto-Medium',
                              ),
                            ),
                          )))),
              Container(
                margin: EdgeInsets.only(top: height / 20),
                child: GestureDetector(
                    child: Center(
                  child: Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(
                        color: HexColor('#49657A'),
                        fontSize: 14,
                        fontFamily: 'Roboto-Light',
                        decoration: TextDecoration.underline),
                  ),
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: height / 25),
                child: GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Registro()),
                        ),
                    child: Center(
                      child: Text(
                        '¿No tienes cuenta? Regístrate',
                        style: TextStyle(
                            color: HexColor('#49657A'),
                            fontSize: 14,
                            fontFamily: 'Roboto-Light',
                            decoration: TextDecoration.underline),
                      ),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: height / 25),
                child: GestureDetector(
                    onTap: () {
                      _preferenceLogin.typeLogin(false).then((value) => {
                            Navigator.of(context).pop(),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Index(),
                                ))
                          });
                    },
                    child: Center(
                      child: Text(
                        'continuar sin registrarme',
                        style: TextStyle(
                          color: HexColor('#103E68'),
                          fontSize: 18,
                          fontFamily: 'Raca Bold',
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

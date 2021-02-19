import 'dart:io';

import 'package:aprendiendo/src/functions/preferenceslogin.dart';
import 'package:aprendiendo/src/service/login.service.dart';
import 'package:aprendiendo/src/view/Registro.dart';
import 'package:aprendiendo/src/view/index.dart';
import 'package:aprendiendo/src/view/inicio.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  PreferenceLogin _preferenceLogin = new PreferenceLogin();
  String phonenumber = "";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: height / 8),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(right: width / 2.3),
                child: Text(
                  'I N I C I O  D E  S E S Í O N',
                  style:
                      TextStyle(color: Colors.grey, fontFamily: 'Laca Light'),
                ),
              ),
              BeautyTextfield(
                width: double.maxFinite, //REQUIRED
                height: 60, //REQUIRED
                accentColor: Colors.white, // On Focus Color
                textColor: Colors.grey, //Text Color
                backgroundColor: Colors.white, //Not Focused Color
                textBaseline: TextBaseline.alphabetic,
                autocorrect: false,
                autofocus: false,
                enabled: true, // Textfield enabled
                focusNode: FocusNode(),
                fontFamily: 'Laca Regular', //Text Fontfamily
                fontWeight: FontWeight.w500,
                maxLines: 1,
                margin: EdgeInsets.all(30),
                cornerRadius: BorderRadius.all(Radius.circular(0)),
                duration: Duration(milliseconds: 300),
                inputType: TextInputType.phone, //REQUIRED
                placeholder: "Número de Teléfono",
                isShadow: true,

                prefixIcon: Icon(Icons.lock), //REQUIRED
                onClickSuffix: () {
                  print('Suffix Clicked');
                },

                onChanged: (text) {
                  phonenumber = text;
                },
              ),
              BouncingWidget(
                  duration: Duration(milliseconds: 100),
                  scaleFactor: 1.5,
                  onPressed: () {
                    LoginService loginService = LoginService();
                    loginService.login(phonenumber).then((value) {
                      if (value == null) {
                        Fluttertoast.showToast(
                            msg: "Usuario no registrad@",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1);
                      } else {
                        _preferenceLogin.typeLogin(true).then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Index(),
                              ));
                        });
                      }
                    });
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.grey,
                      child: Container(
                        width: width / 1.5,
                        child: Text(
                          "Ingresar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ))),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  child: Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 35,
                  horizontal: height / 8.5,
                ),
                child: Row(
                  children: [
                    Text(
                      '¿No tienes cuenta?',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    GestureDetector(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registro()),
                            ),
                        child: Text(
                          'Regístrate',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              decoration: TextDecoration.underline),
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: () {
                    _preferenceLogin
                        .typeLogin(false)
                        .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Index(),
                            )));
                  },
                  child: Text(
                    'continuar sin registrarme',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontFamily: 'Laca Black',
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:aprendiendo/src/view/Registro.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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

                margin: EdgeInsets.all(30),
                cornerRadius: BorderRadius.all(Radius.circular(0)),
                duration: Duration(milliseconds: 300),
                inputType: TextInputType.text, //REQUIRED
                placeholder: "Usuario",
                isShadow: true,
                obscureText: false,
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ), //REQUIRED
                onClickSuffix: () {
                  print('Suffix Clicked');
                },
                onTap: () {
                  print('Click');
                },
                onChanged: (text) {
                  print(text);
                },
                onSubmitted: (data) {
                  print(data.length);
                },
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
                inputType: TextInputType.text, //REQUIRED
                placeholder: "Contraseña",
                isShadow: true,
                obscureText: true,
                prefixIcon: Icon(Icons.lock), //REQUIRED
                onClickSuffix: () {
                  print('Suffix Clicked');
                },
                onTap: () {
                  print('Click');
                },
                onChanged: (text) {
                  print(text);
                },
                onSubmitted: (data) {
                  print(data.length);
                },
              ),
              BouncingWidget(
                  duration: Duration(milliseconds: 100),
                  scaleFactor: 1.5,
                  onPressed: () {
                    print("onPressed");
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
                            fontSize: 35,
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
                  horizontal: 100,
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

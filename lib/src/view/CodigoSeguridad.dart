import 'package:aprendiendo/src/service/login.service.dart';
import 'package:aprendiendo/src/view/index.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodigoSeguridad extends StatefulWidget {
  final String phoneNumber;

  CodigoSeguridad({Key key, @required this.phoneNumber}) : super(key: key);

  @override
  _CodigoSeguridadState createState() => _CodigoSeguridadState();
}

class _CodigoSeguridadState extends State<CodigoSeguridad> {
  String securityCode = null;

  var errorController;

  var textEditingController;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: HexColor('#D0EAE5'),
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
                        color: HexColor('#103E68'),
                        fontSize: 24,
                        fontFamily: 'Roboto-Bold')),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: width / 10, bottom: height / 12, right: width / 10),
                child: Text(
                  'Enviaremos un código de 6 digitos a tu numero de teléfono registrado, para verificar tu identidad',
                  style: TextStyle(
                      color: HexColor('#49657A'),
                      fontSize: 16,
                      fontFamily: 'Roboto-Light'),
                ),
              ),
              Container(
                margin: EdgeInsets.all(22),
                child: PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    inactiveFillColor: Colors.white,
                    inactiveColor: HexColor('#103E68'),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    selectedColor: HexColor('#103E68'),
                    selectedFillColor: Colors.white,
                    activeColor: HexColor('#103E68'),
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      securityCode = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
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
                      LoginService loginService = LoginService();
                      loginService
                          .loginOtp(widget.phoneNumber, securityCode)
                          .then((value) {
                        if (value != null) {
                          Navigator.of(context).pop();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Index()));
                        }
                      });
                    }
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: HexColor('#103E68'),
                      child: Container(
                        width: width / 2,
                        child: Text(
                          "Verificar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto-Medium',
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

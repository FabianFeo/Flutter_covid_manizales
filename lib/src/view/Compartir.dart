import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Compartir extends StatefulWidget {
  Compartir({Key key}) : super(key: key);

  @override
  _CompartirState createState() => _CompartirState();
}

class _CompartirState extends State<Compartir> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: HexColor('#DDE9ED'),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: height / 50),
              child: BeautyTextfield(
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
                placeholder: "Buscar Contactos",
                isShadow: true,

                prefixIcon: Icon(Icons.lock), //REQUIRED
                onClickSuffix: () {
                  print('Suffix Clicked');
                },

                onChanged: (text) {},
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height / 7),
              height: height / 10,
              width: width / 1,
              color: HexColor('#698596'),
              child: Container(
                  margin: EdgeInsets.only(right: width / 20, left: width / 20),
                  child: Center(
                    child: Text(
                      'Selecciona los contactos que consideres deben usar Covidalert Manizales.',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: height / 50, color: Colors.white),
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: height / 6),
              height: height / 10,
              width: width / 1,
              color: HexColor('#103E68'),
              child: Container(
                  margin: EdgeInsets.only(right: width / 20, left: width / 20),
                  child: Center(
                    child: Text(
                      'De los contactos que seleccionaste, elige aquellos con quienes convives o te encuentras frecuentemente.',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: height / 50, color: Colors.white),
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: height /1.1, right: width / 2),
                  child: Center(
                    child: BouncingWidget(
                        duration: Duration(milliseconds: 100),
                        scaleFactor: 2,
                        onPressed: () {},
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            color: HexColor('#103E68'),
                            child: Container(
                                width: width / 5,
                                height: height / 20,
                                child: Center(
                                  child: Icon(Icons.skip_previous_rounded,
                                  color: Colors.white,)
                                )))),
                  ),
                ),
                Container(
              margin: EdgeInsets.only(top: height /1.1, right: width / 12),
                  child: Center(
                    child: BouncingWidget(
                        duration: Duration(milliseconds: 100),
                        scaleFactor: 2,
                        onPressed: () {},
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            color: HexColor('#103E68'),
                            child: Container(
                                width: width / 5,
                                height: height / 20,
                                child: Center(
                                  child: Icon(Icons.skip_next_rounded,
                                  color: Colors.white,)
                                )))),
                  ),
                ),
                 Container(
              margin: EdgeInsets.only(top: height /1.1, left: width / 1.9),
                  child: Center(
                    child: BouncingWidget(
                        duration: Duration(milliseconds: 100),
                        scaleFactor: 2,
                        onPressed: () {},
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            color: HexColor('#103E68'),
                            child: Container(
                                width: width / 3,
                                height: height / 20,
                                child: Center(
                                  child: Text(
                                    "Enviar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Roboto-Medium',
                                      fontSize: 20,
                                    ),
                                  ),
                                )))),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CodigoSeguridad extends StatefulWidget {
  CodigoSeguridad({Key key}) : super(key: key);

  @override
  _CodigoSeguridadState createState() => _CodigoSeguridadState();
}

class _CodigoSeguridadState extends State<CodigoSeguridad> {
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
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width / 11),
                child: Text('Introduce tu Código de Seguridad',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

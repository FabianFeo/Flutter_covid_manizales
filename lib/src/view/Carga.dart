import 'package:aprendiendo/src/view/Registro.dart';
import 'package:aprendiendo/src/view/inicio.dart';
import 'package:aprendiendo/src/view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Carga extends StatefulWidget {
  Carga({Key key}) : super(key: key);

  @override
  _CargaState createState() => _CargaState();
}

class _CargaState extends State<Carga> {

  @override
    void initState() { 
      Future.delayed(Duration(seconds: 3),
      ()=> Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => Login())));
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Image(image: AssetImage('assets/Imagenes_assetspng/logos/textura_apertura.png'),
              height: height / 4, 
              width: width,
              alignment: Alignment.centerLeft,),
              Image(image: AssetImage('assets/Imagenes_assetspng/logos/logo_apertura.png'),
              height: height / 7,
              ),
              Container(
                padding: EdgeInsets.all(width /6),
                child:                 
                Text(                
                'Sistema de apoyo para alertas tempranas de posibles contagios mediante técnicas de análisis de datos',
                style: TextStyle(fontFamily:'Roboto-Light', 
                fontSize: 14, 
                color: HexColor("#49657A"),
                
                ),
                textAlign: TextAlign.center,),
               ),
              Image(image: AssetImage('assets/Imagenes_assetspng/logos/logos_apertura.png'),
              height: height / 2.7,)
            ],
          ),
          
          ),
      ),
      
    );
  }
}
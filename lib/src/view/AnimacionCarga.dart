import 'package:aprendiendo/src/view/Carga.dart';
import 'package:flutter/material.dart';

class Animacion extends StatefulWidget {
  Animacion({Key key}) : super(key: key);

  @override
  _AnimacionState createState() => _AnimacionState();
}

class _AnimacionState extends State<Animacion> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> opacidad;

  @override
  void initState() { 

    controller = new AnimationController(vsync: this, duration: Duration( seconds: 2));
    opacidad = new Tween(begin: 0.0, end: 1.0).animate(controller);

    controller.forward();


    super.initState();
    
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: FadeTransition(
         opacity: opacidad,
         child: Carga(),
       ),
    );
  }
}
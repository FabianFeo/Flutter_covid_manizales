import 'package:aprendiendo/src/view/login.dart';
import 'package:aprendiendo/src/view/index.dart';
import 'package:aprendiendo/src/view/prueba.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'laca'),
      home: Index(),
    );
  }
}

import 'package:flutter/material.dart';

class Prueba extends StatefulWidget {
  Prueba({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Prueba> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      margin: EdgeInsets.only(top: height / 4),
      alignment: AlignmentDirectional.center,
      child: Column(
        children: [
          Container(
            child: Text('Mi primera app'),
          ),
          Container(
            child: Card(
              child: Text('estilo',
                  style: TextStyle(
                    color: Colors.red,
                  )),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Image.network('https://i.stack.imgur.com/SvmBH.png'),
                Image.network('https://i.stack.imgur.com/SvmBH.png')
              ],
            ),
          )
        ],
      ),
    )));
  }
}

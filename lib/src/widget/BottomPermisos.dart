import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPermision extends StatefulWidget {
  ButtonPermision({Key key}) : super(key: key);

  @override
  _ButtonPermisionState createState() => _ButtonPermisionState();
}

class _ButtonPermisionState extends State<ButtonPermision> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10 ),
          width: MediaQuery.of(context).size.width / 2,
          child: Text('Activar Permisos', style: TextStyle(color: Colors.grey[600]),),
        ),
        Container(
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 10 ),
          width: MediaQuery.of(context).size.width / 6,
          child: Container(
              width: MediaQuery.of(context).size.width / 6,
              child: CustomSwitch(
            activeColor: Colors.blueAccent,
            value: status,
            onChanged: (value) {
              print("VALUE : $value");
              setState(() {
                status = value;
              });
            },
          )),
        ),
      ],
    );
  }
}

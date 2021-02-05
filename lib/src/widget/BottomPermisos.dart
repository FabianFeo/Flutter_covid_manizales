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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: width / 13),
          width: width / 2,
          child: Text(
            'Activar Permisos',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: width / 15),
            width: width /5,
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
      ],
    );
  }
}

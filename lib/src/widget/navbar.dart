import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({
    Key key,
    this.current,
    this.scaffoldKey,
  }) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String current;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    DateTime dateTime = DateTime.now();
    return AppBar(
      backgroundColor: Colors.white,   
       automaticallyImplyLeading: false,
      actions: [
        Container(
          height: height / 2,
          width: width / 4,
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: width / 11),
          child: Text(
            DateFormat('dd-MM-yyyy').format(dateTime),
            style: TextStyle(color: HexColor('#103E68'), fontSize: 14),
          ),
        ),
        Container(
          width: width / 2.5,
          margin: EdgeInsets.only(right: width / 6),
          child: Image(
            image: AssetImage('assets/Marca_png/Logo_CoVIDAlert_positivo.png'),
            height: height / 20,
            width: width / 2.3,
          ),
        ),
        GestureDetector(
          child: Icon(
            Icons.dehaze,
            color: HexColor('#103E68'),
            size: height / 30,
          ),
          onTap: () { _openEndDrawer();},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);

  void _openEndDrawer() {
    scaffoldKey.currentState.openEndDrawer();
  }
}

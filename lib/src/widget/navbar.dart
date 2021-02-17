import 'package:aprendiendo/src/view/ControlPermisos.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title:Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '20 Dic 2020',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Image(
            image: AssetImage('assets/Marca_png/Logo_CoVIDAlert_positivo.png'),
            height: height / 20,
            width: width / 2.3,
          ),
          Container(
            margin: EdgeInsets.only(left: width/ 8),
            child: GestureDetector(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ControlPermisos()),
                    ),
                child: Icon(
                  Icons.reorder_rounded,
                  color: Colors.grey,
                )),
          )
        ],
      ),

      );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}

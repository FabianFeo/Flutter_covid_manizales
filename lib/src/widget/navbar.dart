import 'package:aprendiendo/src/view/ControlPermisos.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({
    Key key, this.current,
  }) : super(key: key);
final String current;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '16 Feb 2021',
            style: TextStyle(color: HexColor('#103E68'), fontSize: 14),
          ),
          Image(
            image: AssetImage('assets/Marca_png/Logo_CoVIDAlert_positivo.png'),
            height: height / 20,
            width: width / 2.3,
          ),
          Container(
              
              
              child: DropdownButton<String>(
                value: current,
                icon: Icon(
                  Icons.reorder_rounded,
                  color: HexColor('#103E68'),
                ),
                iconSize: 24,
                elevation: 16,
                onChanged: (String newValue) {},
                items: getWidgetsMenu(),
              ) /*GestureDetector(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ControlPermisos()),
                    ),
                child: ,
          )*/
              )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}

Widget getCurrentWidget() {
  return Container();
}

List<DropdownMenuItem<String>> getWidgetsMenu() {
  List<DropdownMenuItem<String>> lista = List();

  lista.add(DropdownMenuItem(
      value: 'Control de permisos', child: Text('Control de permisos'),));
  return lista;
}

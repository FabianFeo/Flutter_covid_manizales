import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Icon(
            Icons.not_listed_location_rounded,
            color: Colors.grey,
          ),
          Text(
            'Preguntas',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Image(
            image: AssetImage('assets/Marca_png/Logo_CoVIDAlert_positivo.png'),
            height: height/20,
            width: width/2.3,
          ),
          Icon(
            Icons.lock,
            color: Colors.grey,
          ),
          Text(
            'Permisos',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}

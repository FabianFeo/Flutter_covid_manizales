import 'package:aprendiendo/src/view/AnimacionCarga.dart';
import 'package:aprendiendo/src/view/CambioIdioma.dart';
import 'package:aprendiendo/src/view/login.dart';
import 'package:aprendiendo/src/view/index.dart';
import 'package:aprendiendo/src/view/prueba.dart';
import 'package:flutter/material.dart';
import 'Carga.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'laca'),
      home: Animacion(),
      supportedLocales: [Locale('en'), Locale('es')],
      localizationsDelegates: [
        CambioIdioma.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}

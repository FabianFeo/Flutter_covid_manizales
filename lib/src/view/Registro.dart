import 'package:aprendiendo/generated/l10n.dart';
import 'package:aprendiendo/src/functions/preferenceslogin.dart';
import 'package:aprendiendo/src/model/registration.model.dart';
import 'package:aprendiendo/src/service/barrio.service.dart';
import 'package:aprendiendo/src/service/comuna.service.dart';
import 'package:aprendiendo/src/service/register.service.dart';
import 'package:aprendiendo/src/view/AclaracionesPrivacidad.dart';
import 'package:aprendiendo/src/view/index.dart';
import 'package:aprendiendo/src/view/login.dart';
import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:direct_select/direct_select.dart';

class Registro extends StatefulWidget {
  Registro({Key key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  String _myActivity;
  ComunaService comunaService = ComunaService();
  int group = 1;
  String _myActivity2;
  Widget dropdawn = CircularProgressIndicator();
  RegistroService registroService = RegistroService();
  String _myActivity3;
  List<dynamic> cumunaDataSource = List();
  List<dynamic> _barrioDataSource = List();
  bool diagnosticadoCovid = false;
  bool loadingBarrios = false;
  Registration registration = new Registration();
  PreferenceLogin _preferenceLogin = new PreferenceLogin();
  @override
  void initState() {
    super.initState();
    loadComunaData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: HexColor('#DDE9ED'),
      appBar: NavBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: height / 25),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(right: width / 1.6),
                  child: Text(S.of(context).simpleText,
                      style: TextStyle(
                          color: HexColor('#103E68'),
                          fontFamily: 'Roboto-Bold',
                          fontSize: 20))),
              Container(
                  margin: EdgeInsets.only(top: height / 25),
                  width: width / 1.2,
                  height: height / 13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: _myActivity,
                          icon: const Icon(Icons.arrow_downward),
                          hint: Container(
                            margin: EdgeInsets.only(left: width / 8),
                            child: Text(
                              'Tipo de documento',
                              style: TextStyle(
                                  color: HexColor('#698596'),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 20),
                          underline: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            setState(() {
                              _myActivity = value;
                            });
                            registration.document_type = value;
                          },
                          items: [
                        DropdownMenuItem(
                          child: Container(
                            margin: EdgeInsets.only(left: width / 8),
                            child: Text('C.C'),
                          ),
                          value: 'CC',
                        ),
                        DropdownMenuItem(
                          child: Container(
                            margin: EdgeInsets.only(left: width / 8),
                            child: Text('C.E'),
                          ),
                          value: 'CE',
                        ),
                        DropdownMenuItem(
                          child: Container(
                            margin: EdgeInsets.only(left: width / 8),
                            child: Text('T.I'),
                          ),
                          value: 'TI',
                        ),
                      ]))),
              BeautyTextfield(
                width: double.maxFinite, //REQUIRED
                height: 60, //REQUIRED
                accentColor: Colors.white, // On Focus Color
                textColor: HexColor('#698596'), //Text Color
                backgroundColor: Colors.white, //Not Focused Color
                textBaseline: TextBaseline.alphabetic,
                autocorrect: false,
                autofocus: false,
                enabled: true, // Textfield enabled
                focusNode: FocusNode(),
                fontFamily: 'Roboto-Light', //Text Fontfamily
                fontWeight: FontWeight.w500,
                margin: EdgeInsets.only(
                    top: height / 25, left: width / 12, right: width / 12),
                cornerRadius: BorderRadius.all(Radius.circular(50)),
                duration: Duration(milliseconds: 300),
                inputType: TextInputType.number, //REQUIRED
                placeholder: "Número Documento",
                isShadow: true,
                obscureText: false,
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ), //REQUIRE

                onChanged: (text) {
                  registration.document_number = text;
                },
              ),
              
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: BorderSide(color: Colors.grey),
                ),
                margin: EdgeInsets.all(30),
                child: Center(
                    child: GestureDetector(
                        onTap: () async {
                          final DateTime picked = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: DateTime.now(),
                              lastDate: DateTime(2100));
                          if (picked != null) {
                            final DateFormat formatter =
                                DateFormat('yyyy-MM-dd');
                            final String formatted = formatter.format(picked);
                            setState(() {
                              registration.birth_date = formatted;
                            });
                          }
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              registration.birth_date == null
                                  ? 'Fecha de Nacimiento'
                                  : registration.birth_date,
                              style: TextStyle(
                                  color: HexColor('#698596'),
                                  fontSize: height / 40,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          height: 60,
                          width: width,
                        ))),
              ),
              BeautyTextfield(
                width: double.maxFinite, //REQUIRED
                height: 60, //REQUIRED
                accentColor: Colors.white, // On Focus Color
                textColor: HexColor('#698596'), //Text Color
                backgroundColor: Colors.white, //Not Focused Color
                textBaseline: TextBaseline.alphabetic,
                autocorrect: false,
                autofocus: false,
                enabled: true, // Textfield enabled
                focusNode: FocusNode(),
                fontFamily: 'Laca Regular', //Text Fontfamily
                fontWeight: FontWeight.w500,

                margin: EdgeInsets.only(
                    top: height / 150, left: width / 12, right: width / 12),
                cornerRadius: BorderRadius.all(Radius.circular(50)),
                duration: Duration(milliseconds: 300),
                inputType: TextInputType.phone, //REQUIRED
                placeholder: "Celular",
                isShadow: true,
                obscureText: false,
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ), //REQUIRED

                onChanged: (text) {
                  registration.cellphone = text;
                },
              ),
              this.cumunaDataSource.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(top: height / 25),
                      width: width / 1.2,
                      height: height / 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              value: _myActivity2,
                              icon: const Icon(Icons.arrow_downward),
                              hint: Container(
                                margin: EdgeInsets.only(left: width / 8),
                                child: Text(
                                  'Comuna',
                                  style: TextStyle(
                                      color: HexColor('#698596'),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(
                                  color: Colors.blue, fontSize: 20),
                              underline: Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  setBarrio(value.toString());
                                  _myActivity2 = value;
                                });
                              },
                              items: this
                                  .cumunaDataSource
                                  .map<DropdownMenuItem<String>>((e) =>
                                      DropdownMenuItem(
                                        child: Container(
                                          margin:
                                              EdgeInsets.only(left: width / 8),
                                          child: Text(e['display']),
                                        ),
                                        value: e['value'],
                                      ))
                                  .toList())))
                  : CircularProgressIndicator(),
              loadingBarrios
                  ? CircularProgressIndicator()
                  : Container(
                      margin: EdgeInsets.only(top: height / 25),
                      width: width / 1.2,
                      height: height / 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              value: _myActivity3,
                              icon: const Icon(Icons.arrow_downward),
                              hint: Container(
                                padding: EdgeInsets.only( right: width / 5),
                                margin: EdgeInsets.only(left: width / 8),
                                child: Text(
                                  'Barrio',
                                  style: TextStyle(
                                      color: HexColor('#698596'),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(
                                  color: Colors.blue, fontSize: 20),
                              underline: Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              onChanged: (value) {
                                registration.neighborhood = int.parse(value);
                                setState(() {
                                  _myActivity3 = value;
                                });
                              },
                              items: this
                                  ._barrioDataSource
                                  .map<DropdownMenuItem<String>>(
                                      (e) => DropdownMenuItem(
                                            child: Container(
                                              padding:EdgeInsets.only( left: width / 9),
                                              child: Text(e['display']),
                                            ),
                                            value: e['value'],
                                          ))
                                  .toList()))),
              Container(
                  alignment: Alignment.center,
                  child: BouncingWidget(
                      duration: Duration(milliseconds: 100),
                      scaleFactor: 1.5,
                      onPressed: () {
                        String faltante = registration.anyNull();
                        if (faltante != null) {
                          Fluttertoast.showToast(
                              msg:
                                  "Porfavor complete la siguiente informacion: " +
                                      faltante,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1);
                        } else {
                          try {
                            registroService
                                .register(registration)
                                .then((value) {
                              if (value == 'Enter a valid phone number.') {
                                Fluttertoast.showToast(
                                    msg:
                                        "Ingrese un número de teléfono válido.",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1);
                              } else {
                                _preferenceLogin.typeLogin(true).then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AclaracionesPrivacidad(),
                                        // builder: (context) => Index(),
                                      ));
                                });
                              }
                            });
                          } catch (e) {
                            Fluttertoast.showToast(
                                msg: e.toString(),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1);
                          }
                        }
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: height / 25),
                          alignment: Alignment.center,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              color: HexColor('#103E68'),
                              child: Container(
                                  width: width / 2,
                                  height: height / 20,
                                  child: Center(
                                    child: Text(
                                      "Registrarme",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Roboto-Medium',
                                        fontSize: 20,
                                      ),
                                    ),
                                  )))))),
              Container(
                margin: EdgeInsets.only(top: height / 25),
                child: GestureDetector(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        ),
                    child: Center(
                      child: Text(
                        '¿Ya estás registrado? Inicia Sesión',
                        style: TextStyle(
                            color: HexColor('#49657A'),
                            fontSize: 14,
                            fontFamily: 'Roboto-Light',
                            decoration: TextDecoration.underline),
                      ),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: height / 25),
                child: GestureDetector(
                    onTap: () {
                      _preferenceLogin.typeLogin(false).then((value) => {
                            Navigator.of(context).pop(),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Index(),
                                ))
                          });
                    },
                    child: Center(
                      child: Text(
                        'continuar sin registrarme',
                        style: TextStyle(
                          color: HexColor('#103E68'),
                          fontSize: 18,
                          fontFamily: 'Raca Bold',
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  setBarrio(String codigoComuna) async {
    List<dynamic> data = List();
    BarrioService barrioService = new BarrioService();
    setState(() {
      loadingBarrios = true;
    });
    await barrioService
        .getBarrio(codigoComuna)
        .then((List<dynamic> dataService) => {
              dataService.forEach((element) => {
                    data.add({
                      "display": element['name'],
                      "value": element['id'].toString(),
                    })
                  })
            });
    setState(() {
      loadingBarrios = false;
      this._barrioDataSource = data;
    });
  }

  void loadComunaData() async {
    List<dynamic> data = List();
    await comunaService.getComuna().then((List<dynamic> dataService) {
      dataService.forEach((element) => {
            data.add({
              "display": element['name'],
              "value": element['id'].toString(),
            })
          });
      setState(() {
        this.cumunaDataSource = data;
      });
    });
  }
}

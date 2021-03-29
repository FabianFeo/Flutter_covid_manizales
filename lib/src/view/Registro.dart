import 'package:aprendiendo/src/functions/preferenceslogin.dart';
import 'package:aprendiendo/src/model/registration.model.dart';
import 'package:aprendiendo/src/service/barrio.service.dart';
import 'package:aprendiendo/src/service/comuna.service.dart';
import 'package:aprendiendo/src/service/register.service.dart';
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
      appBar: NavBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: height / 8),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(right: width / 1.6),
                  child: Text('Registro',
                      style: TextStyle(
                          color: HexColor('#103E68'),
                          fontFamily: 'Roboto-Bold',
                          fontSize: 24))),

             
              Container(
                margin: EdgeInsets.all(25),
                child: DropDownFormField(
                  titleText: 'Tipo de Documento',
                  hintText: '',
                  value: _myActivity,
                  onSaved: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                    registration.document_type = value;
                  },
                  dataSource: [
                    {
                      "display": "C.C",
                      "value": "CC",
                    },
                    {
                      "display": "C.E",
                      "value": "CE",
                    },
                    {
                      "display": "T.I",
                      "value": "TI",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
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
                fontFamily: 'Roboto-Light', //Text Fontfamily
                fontWeight: FontWeight.w500,

                margin: EdgeInsets.all(30),
                cornerRadius: BorderRadius.all(Radius.circular(50)),
                duration: Duration(milliseconds: 300),
                inputType: TextInputType.number, //REQUIRED
                placeholder: "Número de documento",
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
              Container(
                margin: EdgeInsets.only(right: width / 2.5),
                child: Text(
                  'Fecha de Nacimiento',
                  style: TextStyle(
                      fontFamily: 'Roboto-Medium',
                      color: HexColor('#49657A'),
                      fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.all(25),
                child: DateTimePicker(
                  initialValue: '',
                  firstDate: DateTime(1920),
                  lastDate: DateTime(2100),
                  dateLabelText: 'DD/MM/AAAA',
                  onChanged: (val) {
                    print(val);
                    registration.birth_date = val;
                  },
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) {
                    print(val);
                    registration.birth_date = val;
                  },
                ),
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

                margin: EdgeInsets.all(30),
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
                      margin: EdgeInsets.all(25),
                      child: DropDownFormField(
                        titleText: 'Comuna',
                        hintText: '',
                        value: _myActivity2,
                        onSaved: (value) {
                          setState(() {
                            _myActivity2 = value;
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            setBarrio(value.toString());
                            _myActivity2 = value;
                          });
                        },
                        dataSource: this.cumunaDataSource,
                        textField: 'display',
                        valueField: 'value',
                      ),
                    )
                  : CircularProgressIndicator(),
              loadingBarrios
                  ? CircularProgressIndicator()
                  : Container(
                      margin: EdgeInsets.all(25),
                      child: DropDownFormField(
                        titleText: 'Barrio',
                        hintText: '',
                        value: _myActivity3,
                        onSaved: (value) {
                          setState(() {
                            _myActivity3 = value;
                          });
                        },
                        onChanged: (value) {
                          registration.neighborhood = int.parse(value);
                          setState(() {
                            _myActivity3 = value;
                          });
                        },
                        dataSource: _barrioDataSource,
                        textField: 'display',
                        valueField: 'value',
                      ),
                    ),
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
                                        builder: (context) => Index(),
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
                          alignment: Alignment.center,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              color: HexColor('#103E68'),
                              child: Container(
                                width: width / 2.5,
                                height: height / 22,
                                child: Center(
                                  child: Text(
                                  "Registrarme",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto-Medium',
                                    fontSize: height / 40,
                                  ),
                                ),
                                )
                              ))))),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 35,
                  horizontal: 80,
                ),
                child: Row(
                  children: [
                    Text(
                      '¿Ya estás registrado?',
                      style:
                          TextStyle(color: HexColor('#49657A'), fontSize: 15),
                    ),
                    GestureDetector(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            ),
                        child: Text(
                          'Inicia Sesión',
                          style: TextStyle(
                              color: HexColor('#49657A'),
                              fontSize: 15,
                              decoration: TextDecoration.underline),
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: width / 25,
                ),
                child: GestureDetector(
                  child: Text(
                    'Continuar sin registrarme',
                    style: TextStyle(
                        color: HexColor('#49657A'),
                        fontSize: 18,
                        fontFamily: 'Laca Black',
                        decoration: TextDecoration.underline),
                  ),
                ),
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

import 'package:aprendiendo/src/model/registration.model.dart';
import 'package:aprendiendo/src/service/comuna.service.dart';
import 'package:aprendiendo/src/view/login.dart';
import 'package:aprendiendo/src/widget/navbar.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';

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
Widget dropdawn=CircularProgressIndicator();
  String _myActivity3;
  List<dynamic> cumunaDataSource = List();
  @override
  void initState() { 
    super.initState();
    loadComunaData();
  }
  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Registration registration = new Registration();
    return Scaffold(
      appBar: NavBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: height / 8),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(right: width / 2),
                  child: Text('R E G I S T R O',
                      style: TextStyle(
                          color: Colors.grey, fontFamily: 'Laca light'))),
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
                textColor: Colors.grey, //Text Color
                backgroundColor: Colors.white, //Not Focused Color
                textBaseline: TextBaseline.alphabetic,
                autocorrect: false,
                autofocus: false,
                enabled: true, // Textfield enabled
                focusNode: FocusNode(),
                fontFamily: 'Laca Regular', //Text Fontfamily
                fontWeight: FontWeight.w500,

                margin: EdgeInsets.all(30),
                cornerRadius: BorderRadius.all(Radius.circular(0)),
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
                margin: EdgeInsets.all(25),
                child: DateTimePicker(
                  initialValue: '',
                  firstDate: DateTime(1920),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Fecha de Nacimiento',
                  onChanged: (val) => print(val),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) => registration.birth_date = val,
                ),
              ),              
              BeautyTextfield(
                width: double.maxFinite, //REQUIRED
                height: 60, //REQUIRED
                accentColor: Colors.white, // On Focus Color
                textColor: Colors.grey, //Text Color
                backgroundColor: Colors.white, //Not Focused Color
                textBaseline: TextBaseline.alphabetic,
                autocorrect: false,
                autofocus: false,
                enabled: true, // Textfield enabled
                focusNode: FocusNode(),
                fontFamily: 'Laca Regular', //Text Fontfamily
                fontWeight: FontWeight.w500,

                margin: EdgeInsets.all(30),
                cornerRadius: BorderRadius.all(Radius.circular(0)),
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
                            registration.comuna=int.parse(value);
                            _myActivity2 = value;
                          });
                        },
                        dataSource: this.cumunaDataSource,
                        textField: 'display',
                        valueField: 'value',
                      ),
                    )
                  : CircularProgressIndicator(),
              Container(
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
                    setState(() {
                      _myActivity3 = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Hospital Geriátrico San Isidro",
                      "value": "Hospital Geriátrico San Isidro",
                    },
                    {
                      "display": "Escuela de Trabajo la Linda",
                      "value": "Escuela de Trabajo la Linda",
                    },
                    {
                      "display": "Villa Pilar II",
                      "value": "Villa Pilar II",
                    },
                    {
                      "display": " Venecia",
                      "value": " Venecia",
                    },
                    {
                      "display": "Torres de Ávila",
                      "value": "Torres de Ávila",
                    },
                    {
                      "display": "San Luis",
                      "value": "San Luis",
                    },
                    {
                      "display": "Aquilino Villegas",
                      "value": "Aquilino Villegas",
                    },
                    {
                      "display": "La Livonia",
                      "value": "La Livonia",
                    },
                    {
                      "display": "Urb. Atalaya",
                      "value": "Urb. Atalaya",
                    },
                    {
                      "display": " Bello Horizonte",
                      "value": " Bello Horizonte",
                    },
                    {
                      "display": "Santa Mónica",
                      "value": "Santa Mónica",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
             
              Container(
                  margin: EdgeInsets.only(right: width / 4),
                  child: BouncingWidget(
                      duration: Duration(milliseconds: 100),
                      scaleFactor: 1.5,
                      onPressed: () {
                        print("onPressed");
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.grey,
                          child: Container(
                            width: width / 1.5,
                            child: Text(
                              "Registrarme",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          )))),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 35,
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    Text(
                      '¿Ya estás registrado?',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                    GestureDetector(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            ),
                        child: Text(
                          'Inicia Sesión',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              decoration: TextDecoration.underline),
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  right: width / 2.5,
                ),
                child: GestureDetector(
                  child: Text(
                    'continuar sin registrarme',
                    style: TextStyle(
                        color: Colors.grey,
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

  void loadComunaData() async {
    List<dynamic> data = List();
    await comunaService
        .getComuna()
        .then((List<dynamic> dataService) {
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

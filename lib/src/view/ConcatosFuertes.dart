import 'package:aprendiendo/src/service/contactos.service.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

class ContactosFuertes extends StatefulWidget {
  ContactosFuertes({Key key, this.listaContactos ,this.permisos}) : super(key: key);
  final bool permisos;
  final List<Contact> listaContactos;
  @override
  _ContactosFuertesState createState() => _ContactosFuertesState();
}

class _ContactosFuertesState extends State<ContactosFuertes> {
  bool listado = false;
  Widget dataContacts;
  Iterable<Contact> data;
  Iterable<Contact> dataFiltro;
  Map<String, bool> mapaValue = Map();
  ContactosService contactosService = ContactosService();
  String filtro;
  List<String> numeros = List();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
       backgroundColor: HexColor('#DDE9ED'),
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 50),
                child: Column(children: [
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
                    inputType: TextInputType.text, //REQUIRED
                    placeholder: "Buscar Contacto",
                    isShadow: true,
                    obscureText: false,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ), //REQUIRED

                    onChanged: (text) {
                      setState(() {
                        filtro = text;
                      });
                    },
                  ),
                  Container(
                    height: height / 10,
                    width: width / 1,
                    color: HexColor('#72AB82'),
                    child: Container(
                        margin: EdgeInsets.only(
                            right: width / 20, left: width / 20),
                        child: Center(
                          child: Text(
                            'De los contactos que seleccionaste. Elige aquellos con quienes convives o te encuentras frecuentemente.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: height / 50, color: Colors.white),
                          ),
                        )),
                  ),
                  widget.permisos
                      ? StreamBuilder<List<Contact>>(
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Contact>> snapshot) {
                            data = widget.listaContactos;
                            dataFiltro = data;
                            if (dataFiltro != null) {
                              listaContactos();
                            }
                            return dataFiltro != null
                                ? SingleChildScrollView(
                                    child: Container(
                                    margin: EdgeInsets.only(
                                        left: width / 20, right: width / 20),
                                    height: MediaQuery.of(context).size.height /
                                        1.6,
                                    child: dataContacts,
                                  ))
                                : CircularProgressIndicator();
                          },
                        )
                      : Container(),
                  GestureDetector(
                      onTap: () =>
                          contactosService.postContactos(numeros).then((e) => {
                                Fluttertoast.showToast(
                                    msg: 'Datos Completados ',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1)
                              }),
                      child: Container(
                        margin: EdgeInsets.only(left: width / 20, top: height / 50),
                        child: Row(
                          children: [
                            BouncingWidget(child: 
                            Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                color: HexColor('#103E68'),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    height:
                                        MediaQuery.of(context).size.height / 22,
                                    child: Center(
                                      child: Text(
                                        "Anterior",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          fontFamily: 'Roboto-Medium',
                                        ),
                                      ),
                                    ))),
                              onPressed: () async{
                                Navigator.pop(context);
                              },
                            ),
                            Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                color: HexColor('#103E68'),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    height:
                                        MediaQuery.of(context).size.height / 22,
                                    child: Center(
                                      child: Text(
                                        "Enviar",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          fontFamily: 'Roboto-Medium',
                                        ),
                                      ),
                                    ))),
                          ],
                        ),
                      ))
                ]))));
  }

  listaContactos() {
    aplicarFiltro();

    List<Widget> lista = List();
    dataFiltro.forEach((elment) {
      if (mapaValue[elment.identifier] == null) {
        mapaValue[elment.identifier] = false;
      }

      List<Widget> phones = List();
      elment.displayName != null
          ? phones.add(Text(
              elment.displayName,
              textAlign: TextAlign.left,
            ))
          : print('');
      elment.phones != null ? elment.phones.forEach((elment2) {}) : print('');

      elment.displayName != null
          ? lista.add(GestureDetector(
              onTap: () {
                setState(() {
                  if (elment.phones.first.value != null) {
                    numeros
                        .add(elment.phones.first.value.replaceAll('+57', ''));
                    listado = true;
                    mapaValue[elment.identifier] = true;
                  }
                });
              },
              child: Container(
                  child: Card(
                      child: Row(
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height / 19,
                      width: MediaQuery.of(context).size.height / 3,
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Container(
                              child: Column(
                            children: phones,
                          ))
                        ],
                      )),
                  listado
                      ? Container(
                          child: Checkbox(
                            onChanged: (e) {
                              setState(() {
                                if (elment.phones.first.value != null) {
                                  if (e) {
                                    numeros.add(elment.phones.first.value
                                        .replaceAll('+57', ''));
                                  } else {
                                    numeros.remove(elment.phones.first.value
                                        .replaceAll('+57', ''));
                                  }
                                  if (numeros.isEmpty) {
                                    listado = false;
                                  }

                                  mapaValue[elment.identifier] = e;
                                }
                              });
                            },
                            value: mapaValue[elment.identifier],
                          ),
                        )
                      : Container()
                ],
              ))),
            ))
          : Container();
    });
    dataContacts = ListView(
      children: lista,
    );
  }

  void aplicarFiltro() {
    if (filtro != null && data != null) {
      dataFiltro = data.where((i) {
        if (i != null && i.displayName != null) {
          return i.displayName.toUpperCase().contains(filtro.toUpperCase());
        } else {
          return false;
        }
      }).toList();
    }
  }
}
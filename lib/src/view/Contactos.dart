import 'package:aprendiendo/src/service/contactos.service.dart';
import 'package:aprendiendo/src/view/ConcatosFuertes.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

class Contactos extends StatefulWidget {
  Contactos({Key key, this.permisos}) : super(key: key);
  final bool permisos;
  @override
  _ContactosState createState() => _ContactosState();
}

class _ContactosState extends State<Contactos> {
  bool listado = false;
  Widget dataContacts;
  Iterable<Contact> data;
  List<Contact> seleccionados = List();
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
                    onTap: () {},
                    onChanged: (text) {
                      setState(() {
                        filtro = text;
                      });
                    },
                  ),
                  Container(
                    height: height / 10,
                    width: width / 1,
                    color: HexColor('#698596'),
                    child: Container(
                        margin: EdgeInsets.only(
                            right: width / 20, left: width / 20),
                        child: Center(
                          child: Text(
                            'Selecciona los contactos que consideres deben usar Covidalert Manizales.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: height / 50, color: Colors.white),
                          ),
                        )),
                  ),
                  widget.permisos
                      ? StreamBuilder<Iterable<Contact>>(
                          stream: ContactsService.getContacts().asStream(),
                          builder: (BuildContext context,
                              AsyncSnapshot<Iterable<Contact>> snapshot) {
                            data = snapshot.data;
                            dataFiltro = data;
                            if (snapshot.data != null && dataFiltro != null) {
                              listaContactos();
                            }
                            return snapshot.data != null && dataFiltro != null
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
                        margin:
                            EdgeInsets.only(left: width / 20, top: height / 50),
                        child: Row(
                          children: [
                            BouncingWidget(
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  color: HexColor('#103E68'),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              22,
                                      child: Center(
                                        child: Text(
                                          "Siguiente",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            fontFamily: 'Roboto-Medium',
                                          ),
                                        ),
                                      ))),
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ContactosFuertes(
                                      permisos: true,
                                      listaContactos: seleccionados,
                                    ),
                                  ),
                                );
                              },
                            )
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
                    seleccionados.add(elment);
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
                                    seleccionados.add(elment);
                                  } else {
                                    numeros.remove(elment.phones.first.value
                                        .replaceAll('+57', ''));
                                    seleccionados.removeWhere((element) =>
                                        element.identifier ==
                                        elment.identifier);
                                  }
                                  if (numeros.isEmpty) {
                                    listado = false;
                                    seleccionados.clear();
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

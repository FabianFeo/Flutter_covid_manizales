import 'package:aprendiendo/src/service/contactos.service.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
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
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 18),
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
                                    msg:
                                        'Datos Completados ',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1)
                              }),
                      child: Container(
                        height: MediaQuery.of(context).size.height -
                            MediaQuery.of(context).size.height / 1.6 -
                            (60 * 2.3),
                        child: Row(
                          children: [
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
                                  child: Text(
                                    "Enviar invitacion",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: 'Roboto-Medium',
                                    ),
                                  ),
                                )),
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
      elment.phones != null
          ? elment.phones.forEach((elment2) {
              phones.add(Text(elment2.value.toString()));
            })
          : print('');

      elment.displayName != null
          ? lista.add(GestureDetector(
              onLongPress: () {
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
                  Container(
                    alignment: Alignment.topLeft,
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.navigation),
                      backgroundColor: Colors.green,
                    ),
                  ),
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

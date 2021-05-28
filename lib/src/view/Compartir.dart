import 'package:aprendiendo/src/service/contactos.service.dart';
import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Compartir extends StatefulWidget {
  Compartir({Key key, this.permisos}) : super(key: key);
  final bool permisos;

  @override
  _CompartirState createState() => _CompartirState();
}

class _CompartirState extends State<Compartir> {
  TextEditingController searchController = new TextEditingController();
  bool listado = false;
  Widget dataContacts;
  Iterable<Contact> data;
  Iterable<Contact> dataFiltro;
  Map<String, bool> mapaValue = Map();
  ContactosService contactosService = ContactosService();
  String filtro;
  List<String> numeros = List();
  List<Contact> contacts = [];
  List<Contact> contactsFilter = [];
  @override
  void initState() {
    super.initState();
    getAllContacts();
    searchController.addListener(() {
      filterContacts();
    });
  }

  getAllContacts() async {
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    setState(() {
      contacts = _contacts;
    });
  }

  filterContacts() {
    List<Contact> _contacts = [];
    _contacts.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String contactName = contact.displayName.toLowerCase();
        return contactName.contains(searchTerm);
      });

      setState(() {
        contactsFilter = _contacts;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isSearching = searchController.text.isNotEmpty;
    return Scaffold(
      backgroundColor: HexColor('#DDE9ED'),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Container(
                  width: width / 1.1,
                  margin: EdgeInsets.only(top: height / 25),
                  child: Container(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          labelText: 'Buscar contacto',
                          labelStyle: TextStyle(
                              color: HexColor('#698596'),
                              fontSize: height / 40),
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)))),
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: height / 7),
              height: height / 10,
              width: width / 1,
              color: HexColor('#698596'),
              child: Container(
                  margin: EdgeInsets.only(right: width / 20, left: width / 20),
                  child: Center(
                    child: Text(
                      'Selecciona los contactos que consideres deben usar Covidalert Manizales.',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: height / 50, color: Colors.white),
                    ),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: height / 6),
              height: height / 10,
              width: width / 1,
              color: HexColor('#103E68'),
              child: Container(
                  margin: EdgeInsets.only(right: width / 20, left: width / 20),
                  child: Center(
                    child: Text(
                      'De los contactos que seleccionaste, elige aquellos con quienes convives o te encuentras frecuentemente.',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: height / 50, color: Colors.white),
                    ),
                  )),
            ),
            Container(
                margin: EdgeInsets.only(top: height / 4),
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: isSearching == true ? contactsFilter.length : contacts.length,
                    itemBuilder: (context, index) {
                      Contact contact = isSearching == true ? contactsFilter[index] : contacts[index];
                      return ListTile(
                        title: Text(contact.displayName),
                        leading: (contact.avatar != null &&
                                contact.avatar.length > 0)
                            ? CircleAvatar(
                                backgroundImage: MemoryImage(contact.avatar))
                            : CircleAvatar(
                                child: Text(contact.initials()),
                              ),
                      );
                    },
                  ),
                ]))),
            Container(
              margin: EdgeInsets.only(top: height / 1.1, right: width / 2),
              child: Center(
                child: BouncingWidget(
                    duration: Duration(milliseconds: 100),
                    scaleFactor: 2,
                    onPressed: () {},
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        color: HexColor('#103E68'),
                        child: Container(
                            width: width / 5,
                            height: height / 20,
                            child: Center(
                                child: Icon(
                              Icons.skip_previous_rounded,
                              color: Colors.white,
                            ))))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height / 1.1, right: width / 12),
              child: Center(
                child: BouncingWidget(
                    duration: Duration(milliseconds: 100),
                    scaleFactor: 2,
                    onPressed: () {},
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        color: HexColor('#103E68'),
                        child: Container(
                            width: width / 5,
                            height: height / 20,
                            child: Center(
                                child: Icon(
                              Icons.skip_next_rounded,
                              color: Colors.white,
                            ))))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height / 1.1, left: width / 1.9),
              child: Center(
                child: BouncingWidget(
                    duration: Duration(milliseconds: 100),
                    scaleFactor: 2,
                    onPressed: () {},
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        color: HexColor('#103E68'),
                        child: Container(
                            width: width / 3,
                            height: height / 20,
                            child: Center(
                              child: Text(
                                "Enviar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Roboto-Medium',
                                  fontSize: 20,
                                ),
                              ),
                            )))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

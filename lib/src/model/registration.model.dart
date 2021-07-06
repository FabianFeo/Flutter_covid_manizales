class Registration {
  String document_type;
  String document_number;
  String birth_date;

  String cellphone;

  int neighborhood;
  String anyNull() {
    if (document_type == null) {
      return 'Tipo de documento';
    }
    if (document_number == null) {
      return 'Numero de documento';
    }
    if (birth_date == null) {
      return 'Fecha de nacimiento';
    }

    if (cellphone == null) {
      return 'Numero de celular';
    }

    if (neighborhood == null) {
      return 'Barrio';
    }
    return null;
  }

  /*"email": "sw233@mailcatch.com",
    "username": "ohernande",
    "password1": "delfin11",
    "password2": "delfin11",
    "first_name": "Juan Felipe",
    "last_name": "Lopez",
    "document_type":"CC",
    "document_number": "1299004843",
    "birth_date": "1998-11-27",
    "gender": "M",
    "cellphone": "3178990563",
    "comuna": 1,
    "neighborhood": "Aranjuez"*/

}

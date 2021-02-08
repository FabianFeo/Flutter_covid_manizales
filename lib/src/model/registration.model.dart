
class Registration {
  String email;
  String username;
  String password1;
  String password2;
  String first_name;
  String last_name;
  String document_type;
  String document_number;
  String birth_date;
  String gender;
  String cellphone;
  int comuna;
  String neighborhood;
  String anyNull(){
    if (email==null) {
      return 'Correo';
    }
    if (username==null) {
      return 'Nombre de usuario';
    }
    if (password1== null) {
      return 'Contraseña';
    }
    if (password2==null) {
      return 'Confirmacion de contraseña';
    }
    if (first_name==null){
      return 'Nombre';
    }
    if (last_name==null){
      return 'Apellido';
    }
    if (document_type==null){
      return 'Tipo de documento';
    }
    if (document_number==null){
      return 'Numero de documento';
    }
    if (birth_date==null){
      return 'Fecha de nacimiento';
    }
    if (gender==null){
      return 'Genero';
    }
    if (cellphone==null){
      return 'Numero de celular';
    }
    if (comuna==null){
      return 'Comuna';
    }
    if (neighborhood==null){
      return 'Barrio';
    }
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

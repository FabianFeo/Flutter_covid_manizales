import 'dart:convert';

import 'package:aprendiendo/src/functions/PreferenceToken.dart';
import 'package:aprendiendo/src/functions/preferenceUser.dart';
import 'package:http/http.dart' as http;

class LoginService {
  PreferenceToken preferenceToken = PreferenceToken();
  PreferenceUser preferenceUser = PreferenceUser();
  Future login(String phoneNumber) async {
   
      String otp = await _loginRequest(phoneNumber);
      if (otp=="Unregistered user") {
        return null; 
      }
    return await _loginOtp(phoneNumber, otp);
    
    
  }

  Future<String> _loginRequest(String phoneNumber) async {
    http.Response response = await http.post(
        "http://gaia.manizales.unal.edu.co:3200/core/login/",
        body: {"phone_number": phoneNumber});
    Map<String, dynamic> body = jsonDecode(response.body);
    if ( body['data'].toString()=="Unregistered user") {
      return body['data'].toString();
    }
    return body['data']['OTP'].toString();
  }

  Future<String> _loginOtp(String phoneNumber, String otp) async {
    http.Response response = await http.post(
        "http://gaia.manizales.unal.edu.co:3200/core/login/otp/",
        body: {"phone_number": phoneNumber, "OTP": otp});
    Map<String, dynamic> body = jsonDecode(response.body);
    Map<String, dynamic> data = body['data'];
    preferenceToken.setToken(data['token']);
    preferenceUser.setUser(json.encode(data['user']));
    return 'entro';
  }
}

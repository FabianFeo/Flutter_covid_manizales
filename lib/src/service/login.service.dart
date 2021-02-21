import 'dart:convert';

import 'package:aprendiendo/src/functions/LocalNotification.dart' as nt;
import 'package:aprendiendo/src/functions/PreferenceToken.dart';
import 'package:aprendiendo/src/functions/preferenceUser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginService {
  PreferenceToken preferenceToken = PreferenceToken();
  PreferenceUser preferenceUser = PreferenceUser();
 
  Future login(String phoneNumber, BuildContext context) async {
    String otp = await _loginRequest(phoneNumber);
    if (otp == "Unregistered user") {
      return null;
    } else {
      nt.Notification notification = nt.Notification(context);
      notification.initNotification();
      notification.onDidReceiveLocalNotification(
          0,
          'Codigo de seguridad',
          'Tu codigo de seguridad es: ${otp}',
          'Tu codigo de seguridad es: ${otp}',
          );
      return 'codigoEnviado';
    }
  }

  Future<String> _loginRequest(String phoneNumber) async {
    http.Response response = await http.post(
        "http://gaia.manizales.unal.edu.co:3200/core/login/",
        body: {"phone_number": phoneNumber});
    Map<String, dynamic> body = jsonDecode(response.body);
    if (body['data'].toString() == "Unregistered user") {
      return body['data'].toString();
    }
    return body['data']['OTP'].toString();
  }

  Future<String> loginOtp(String phoneNumber,String otp) async {
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

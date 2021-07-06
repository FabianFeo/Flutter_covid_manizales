import 'dart:convert';

import 'package:aprendiendo/src/functions/LocalNotification.dart' as nt;
import 'package:aprendiendo/src/functions/PreferenceToken.dart';
import 'package:aprendiendo/src/functions/preferenceUser.dart';
import 'package:aprendiendo/src/service/sms.service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginService {
  PreferenceToken preferenceToken = PreferenceToken();
  PreferenceUser preferenceUser = PreferenceUser();
  SmsService smsService = SmsService();
  Future login(String phoneNumber, BuildContext context) async {
    String otp = await _loginRequest(phoneNumber);
    if (otp == "Unregistered user") {
      return null;
    } else {
      return 'codigo Enviado';
    }
  }

  Future<String> _loginRequest(String phoneNumber) async {
    http.Response response = await http.post(
        "https://labs.covidalert.com.co/api/core/login/",
        body: {"phone_number": phoneNumber});
    Map<String, dynamic> body = jsonDecode(response.body);
    if (body['data'].toString() == "Unregistered user") {
      return body['data'].toString();
    }
    return body['status'].toString();
  }

  Future<String> loginOtp(String phoneNumber, String otp) async {
    http.Response response = await http.post(
        "https://labs.covidalert.com.co/api/core/login/otp/",
        body: {"phone_number": phoneNumber, "OTP": otp});
    Map<String, dynamic> body = jsonDecode(response.body);
    Map<String, dynamic> data = body['data'];
    preferenceToken.setToken(data['token']);
    preferenceUser.setUser(json.encode(data['user']));
    return 'entro';
  }

  Future<void> logOut() async {
    preferenceToken = null;
  }

  Future<http.Response> changeToken(String token) async {
    http.Response response = await http.post(
        "https://labs.covidalert.com.co/api/api-token-refresh/",
        body: {'token': token});
    return response;
  }
}

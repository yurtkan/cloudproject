import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final loginfield = TextEditingController();
  final passwordfield = TextEditingController();

  void loginAPI() async {
    final SharedPreferences prefs = await _prefs;
    const String APIurl =
        'https://athena.squarefox.org/cloudproject/api/index.php/user/login';
    final bodyRequest = {
      "mail": loginfield.text.toString(),
      "pass": passwordfield.text.toString(),
    };

    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      var data = jsonDecode(response.body);
      // print(data.toString());
      if (response.statusCode == 200) {
        await prefs.setString('uname', data['uname'].toString());
        await prefs.setString('mail', data['mail'].toString());
        await prefs.setString('token', data['token'].toString());
        loginfield.clear();
        passwordfield.clear();
        Get.offNamed('/home');
      } else if (response.statusCode == 401) {
        Get.snackbar(
          'Login Failed',
          'Please check your credentials',
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      } else {
        Get.snackbar('Login Failled', 'maybe a Server trouble',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } catch (e) {
      // print(e);
      Get.snackbar('Exception occured', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    // finally {
    //   print('Request succefuly terminated');
    // }
  }
}
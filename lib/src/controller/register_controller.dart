import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final registerfield = TextEditingController();
  final passwordfield = TextEditingController();
  final unamefield = TextEditingController();

  void registerAPI() async {
    final SharedPreferences prefs = await _prefs;
    const String APIurl =
        'https://athena.squarefox.org/cloudproject/api/index.php/user/register';
    final bodyRequest = {
      "mail": registerfield.text.toString(),
      "pass": passwordfield.text.toString(),
      "uname": unamefield.text.toString(),
    };

    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      var data = jsonDecode(response.body);
      // print(data.toString());
      if (response.statusCode == 201) {
        await prefs.setString('uname', unamefield.text.toString());
        await prefs.setString('mail', registerfield.text.toString());
        await prefs.setString('token', data['token'].toString());
        registerfield.clear();
        passwordfield.clear();
        unamefield.clear();
        Get.offNamed('/home');
      } else if (response.statusCode == 409) {
        Get.snackbar(
          'Register Error',
          'This user already exist',
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

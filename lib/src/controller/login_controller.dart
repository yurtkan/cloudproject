import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final loginfield = TextEditingController();
  final passwordfield = TextEditingController();

  void loginAPI() async {
    const String APIurl =
        'https://athena.squarefox.org/cloudproject/api/index.php/user/login';
    final bodyRequest = {
      "mail": loginfield.text.toString(),
      "pass": passwordfield.text.toString(),
    };

    // print('Request initiated ...');
    // print(bodyRequest);
    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      var data = jsonDecode(response.body);
      // print(data.toString());
      if (response.statusCode == 200) {
        Get.snackbar('Login Successfull', data['token'].toString());
      } else {
        Get.snackbar('Login Failled', 'maybe a Server trouble');
      }
    } catch (e) {
      // print(e);
      Get.snackbar('Exception occured', e.toString());
    }
    // finally {
    //   print('Request succefuly terminated');
    // }
  }
}

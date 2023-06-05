import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  final cityfield = TextEditingController();
  final townfield = TextEditingController();
  final adressfield = TextEditingController();
  String token = "";

  void _getToken() {
    if (GetStorage().read('token') != null) {
      token = GetStorage().read('token');
    }
  }

  void orderAPI() async {
    _getToken();

    const String APIurl =
        'https://athena.squarefox.org/cloudproject/api/index.php/order/confirm';
    final bodyRequest = {
      "token": token,
      "order": "",
      "city": cityfield.toString(),
      "town": townfield.toString(),
      "address": adressfield.toString(),
    };

    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        cityfield.clear();
        townfield.clear();
        townfield.clear();
        Get.offNamed('/home');
      } else if (response.statusCode == 401) {
        Get.snackbar(
          'Login Failed',
          'Please check your credentials',
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      } else {
        Get.snackbar('Login Failed', 'maybe a Server trouble',
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

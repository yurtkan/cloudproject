import 'dart:convert';

import 'package:cloudproject_restaurant_app/src/controller/food_controller.dart';
import 'package:cloudproject_restaurant_app/src/controller/order_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

final OrderMenuController orderMenuController = Get.put(OrderMenuController());

class RegisterController extends GetxController {
  final registerfield = TextEditingController();
  final passwordfield = TextEditingController();
  final unamefield = TextEditingController();

  void registerAPI() async {
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
        GetStorage().write('uname', unamefield.text.toString());
        GetStorage().write('mail', registerfield.text.toString());
        GetStorage().write('token', data['token'].toString());
        orderMenuController.menuAPI();
        registerfield.clear();
        passwordfield.clear();
        unamefield.clear();
        Get.find<FoodController>().updateFilteredFoods();
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

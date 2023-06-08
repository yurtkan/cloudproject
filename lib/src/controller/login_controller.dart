import 'dart:convert';

import 'package:cloudproject_restaurant_app/src/controller/food_controller.dart';
import 'package:cloudproject_restaurant_app/src/controller/order_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

final OrderMenuController orderMenuController = Get.put(OrderMenuController());

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

    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        GetStorage().write('uname', data['uname'].toString());
        GetStorage().write('mail', data['mail'].toString());
        GetStorage().write('token', data['token'].toString());
        loginfield.clear();
        passwordfield.clear();
        orderMenuController.menuAPI();
        orderMenuController.getFoodItems();
        Get.find<FoodController>().updateFilteredFoods();
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

//import 'dart:convert';

import 'package:cloudproject_restaurant_app/src/controller/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

final FoodController foodController = Get.put(FoodController());

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

  void orderAPI(Map items) async {
    _getToken();
    const String APIurl =
        'https://athena.squarefox.org/cloudproject/api/index.php/order/confirm';
    final bodyRequest = {
      "token": token,
      "order": items.toString(),
      "city": cityfield.text.toString(),
      "town": townfield.text.toString(),
      "adress": adressfield.text.toString(),
    };
    // print(bodyRequest);
    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      //var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        cityfield.clear();
        townfield.clear();
        townfield.clear();
        foodController.switchBetweenBottomNavigationItems(0);
        foodController.cartFood.clear();
        Get.offNamed('/home');
        Get.snackbar(
          'Thanks for your order',
          'Order confirmation will be sent on your email adress',
          colorText: Colors.black,
          backgroundColor: Colors.greenAccent,
        );
      } else {
        // print(response.body);
        // print(response.statusCode);
        Get.snackbar(
          'Order Failed',
          'maybe a Server trouble please try later',
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      // print(e);
      Get.snackbar(
        'Exception occured',
        e.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }
}

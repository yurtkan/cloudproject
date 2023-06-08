import 'dart:convert';

import 'package:cloudproject_restaurant_app/src/model/food.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class OrderMenuController extends GetxController {
  // @override
  // void onInit() {
  //   super.onInit();
  //   menuAPI();
  // }

  String? fetchMenu;
  List<Food> foodItems = [];
  List<Food> getFoodItems() {
    menuAPI();
    if (fetchMenu == null) {
      _getMenu();
      //print("Menu fetched from local storage");
    } else {
      //print("Menu fetched from API");
    }
    if (fetchMenu != null) {
      var menu = jsonDecode(fetchMenu!);
      for (var item in menu) {
        // Check if the food item already exists in the list
        bool foodExists = foodItems.any((food) => food.dbid == item['id']);
        if (!foodExists) {
          foodItems.add(
            Food(
              item['id'],
              ("https://athena.squarefox.org/cloudproject/images/${item['photo']}"),
              item['foodname'],
              item['price'].toDouble(),
              1,
              false,
              item['fooddesc'],
            ),
          );
        }
      }
    }
    return foodItems;
  }
  // List<Food> getFoodItems() {
  //   menuAPI();
  //   if (fetchMenu == null) {
  //     _getMenu();
  //     //print("Menu fetched from local storage");
  //   } else {
  //     //print("Menu fetched from API");
  //   }
  //   if (fetchMenu != null) {
  //     var menu = jsonDecode(fetchMenu!);
  //     for (var item in menu) {
  //       foodItems.add(
  //         Food(
  //           item['id'],
  //           ("https://athena.squarefox.org/cloudproject/images/${item['photo']}"),
  //           item['foodname'],
  //           item['price'].toDouble(),
  //           1,
  //           false,
  //           item['fooddesc'],
  //         ),
  //       );
  //     }
  //   }
  //   return foodItems;
  // }

  _getMenu() {
    if (GetStorage().read('menu') != null) {
      fetchMenu = GetStorage().read('menu');
    }
  }

  void menuAPI() async {
    const String APIurl =
        'https://athena.squarefox.org/cloudproject/api/index.php/order/list';
    final bodyRequest = {};

    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      var data = response.body; //response.body);
      if (response.statusCode == 200) {
        fetchMenu = data;
        GetStorage().write('menu', data);
        //print('Menu fetched successfully');
      } else {
        Get.snackbar('Connection Error',
            'Please check your connection and relaunch the app',
            colorText: Colors.white, backgroundColor: Colors.red);
      }
    } catch (e) {
      // print(e);
      Get.snackbar('Exception occured', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }
}

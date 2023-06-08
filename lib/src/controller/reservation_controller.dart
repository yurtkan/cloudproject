import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:cloudproject_restaurant_app/src/model/table.dart';

class ReservationController extends GetxController {
  // @override
  // void onInit() {
  //   super.onInit();
  //   menuAPI();
  // }

  String? fetchReservation;
  List<Table_Res> tableItems = [];
  List<Table_Res> getReservationItems() {
    tableAPI();

    if (fetchReservation != null) {
      var tables = jsonDecode(fetchReservation!);
      for (var item in tables) {
        // Check if the food item already exists in the list
        bool tableExists = tableItems.any((table) => table.id == item['id']);
        if (!tableExists) {
          tableItems.add(
            Table_Res(
              item['id'],
              item['status'],
              item['timeStart'],
              item['timeEnd'],
            ),
          );
        }
      }
    }
    return tableItems;
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

  void tableAPI() async {
    const String APIurl =
        'https://athena.squarefox.org/cloudproject/api/index.php/reservation/list';
    final bodyRequest = {};

    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      var data = response.body; //response.body);
      if (response.statusCode == 200) {
        fetchReservation = data;
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

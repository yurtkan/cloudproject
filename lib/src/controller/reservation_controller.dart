import 'dart:convert';
import 'package:cloudproject_restaurant_app/src/controller/food_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:cloudproject_restaurant_app/src/model/table.dart';

final FoodController foodController = Get.put(FoodController());

class ReservationController extends GetxController {
  // @override
  // void onInit() {
  //   super.onInit();
  //   menuAPI();
  // }

  String? fetchReservation;
  List<TableRes> tableItems = [];
  String token = "";

  List<TableRes> getReservationItems() {
    tableAPI();
    tableItems.clear();
    if (fetchReservation != null) {
      var tables = jsonDecode(fetchReservation!);
      for (var item in tables) {
        tableItems.add(
          TableRes(
            item['id'],
            item['status'],
            item['timeStart'],
            item['timeEnd'],
            item['resDate'],
          ),
        );
      }
    }
    return tableItems;
  }

  void _getToken() {
    if (GetStorage().read('token') != null) {
      token = GetStorage().read('token');
    }
  }

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

  void updateReservationStatus(
      int tid, String tstatus, String tstart, String tend) async {
    _getToken();
    const String APIurl =
        'https://athena.squarefox.org/cloudproject/api/index.php/reservation/confirm';
    final bodyRequest = {
      'token': token,
      'id': tid.toString(),
      'status': tstatus,
      'timeStart': tstart,
      'timeEnd': tend,
    };

    try {
      final response = await http.post(Uri.parse(APIurl), body: bodyRequest);
      var data = response.body; //response.body);
      if (response.statusCode == 200) {
        foodController.switchBetweenBottomNavigationItems(0);
        getReservationItems();
        Get.offAllNamed('/home');
        tableItems.clear();
        Get.snackbar(
          'Reservation confirmed',
          'Reservation confirmation will be sent on your email adress',
          colorText: Colors.black,
          backgroundColor: Colors.greenAccent,
        );
      } else {
        print(response.statusCode);
        print(data);
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

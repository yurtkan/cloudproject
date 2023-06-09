import 'package:cloudproject_restaurant_app/src/controller/food_controller.dart';
import 'package:cloudproject_restaurant_app/src/controller/reservation_controller.dart';
import 'package:cloudproject_restaurant_app/src/model/table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloudproject_restaurant_app/core/app_color.dart';
import 'package:intl/intl.dart';

final FoodController controller = Get.put(FoodController());

final ReservationController reservationController =
    Get.put(ReservationController());
List<TableRes> tableItems = reservationController.tableItems.obs;

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  var ttabletemp = reservationController.getReservationItems();
  @override
  Widget build(BuildContext context) {
    if (tableItems.length == 12) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Reservation",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        // ignore: sized_box_for_whitespace
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    table_button(tableId: 0),
                    table_button(tableId: 1),
                    table_button(tableId: 2),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    table_button(tableId: 3),
                    table_button(tableId: 4),
                    table_button(tableId: 5),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    table_button(tableId: 6),
                    table_button(tableId: 7),
                    table_button(tableId: 8),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    table_button(tableId: 9),
                    table_button(tableId: 10),
                    table_button(tableId: 11),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(16.0),
                            ),
                            onPressed: null, //rezervasyon yapılacak
                            child: const Text(
                              "",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(16.0),
                            ),
                            onPressed: null, //rezervasyon yapılacak
                            child: Text(
                              "Available",
                              style: TextStyle(
                                color: controller.isLightTheme
                                    ? DarkThemeColor.primaryDark
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(16.0),
                            ),
                            onPressed: null, //rezervasyon yapılacak
                            child: Text(
                              "",
                              style: TextStyle(
                                color: controller.isLightTheme
                                    ? DarkThemeColor.primaryDark
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(16.0),
                            ),
                            onPressed: null, //rezervasyon yapılacak
                            child: Text(
                              "Occupied",
                              style: TextStyle(
                                color: controller.isLightTheme
                                    ? DarkThemeColor.primaryDark
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    } else {
      setState(() {
        tableItems = reservationController.getReservationItems();
      });
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

// ignore: camel_case_types
class table_button extends StatelessWidget {
  final int tableId;
  const table_button({
    super.key,
    required this.tableId,
  });

  @override
  Widget build(BuildContext context) {
    Rx<TimeOfDay> time = TimeOfDay.now().obs;
    Rx<TimeOfDay> timeend = TimeOfDay.now().obs;
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: tableItems[tableId].status == "Occupied"
            ? Colors.red
            : Colors.green,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: tableItems[tableId].status == "Occupied"
              ? Colors.white
              : Colors.black,
          padding: const EdgeInsets.all(16.0),
        ),
        onPressed: tableItems[tableId].status == "Occupied"
            ? null
            : () {
                RxBool timeSelectedBool = false.obs;
                RxBool timeSelectedBooll = false.obs;
                Get.defaultDialog(
                  title: "Reservation Details",
                  content: Column(
                    children: [
                      Row(
                        children: [
                          const Text("Reservation Start Time: "),
                          TextButton(
                            onPressed: () async {
                              final TimeOfDay? picked = await showTimePicker(
                                context: context,
                                initialTime: time.value,
                              );
                              if (picked != null && picked != time.value) {
                                time.value = picked;
                                timeSelectedBool.value = true;
                              }
                            },
                            child: Obx(
                              () => timeSelectedBool.value == false
                                  ? const Text('Select Time')
                                  : Text(
                                      time.value.format(context),
                                    ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Reservation End Time: "),
                          TextButton(
                            onPressed: () async {
                              final TimeOfDay? pickedd = await showTimePicker(
                                context: context,
                                initialTime: timeend.value,
                              );
                              if (pickedd != null && pickedd != timeend.value) {
                                timeend.value = pickedd;
                                timeSelectedBooll.value = true;
                              }
                            },
                            child: Obx(
                              () => timeSelectedBooll.value == false
                                  ? const Text('Select Time')
                                  : Text(
                                      timeend.value.format(context),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  textConfirm: "Confirm",
                  textCancel: "Cancel",
                  confirmTextColor: Colors.white,
                  onConfirm: () {
                    final timestart;
                    final timefinish;
                    if (time.value.format(context).endsWith("PM") ||
                        time.value.format(context).endsWith("AM")) {
                      timestart = DateFormat("HH:mm").format(
                        DateFormat("hh:mm a").parse(
                          time.value.format(context),
                        ),
                      );
                    } else {
                      timestart = time.value.format(context);
                    }
                    if (timeend.value.format(context).endsWith("PM") ||
                        timeend.value.format(context).endsWith("AM")) {
                      timefinish = DateFormat("HH:mm").format(
                        DateFormat("hh:mm a").parse(
                          timeend.value.format(context),
                        ),
                      );
                    } else {
                      timefinish = timeend.value.format(context);
                    }

                    reservationController.updateReservationStatus(
                      tableItems[tableId].id,
                      "Occupied",
                      timestart,
                      timefinish,
                    );
                  },
                );
              }, //rezervasyon yapılacak
        child: Text(
          tableItems[tableId].id.toString(),
          style: TextStyle(
            color: tableItems[tableId].status == "Available"
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}

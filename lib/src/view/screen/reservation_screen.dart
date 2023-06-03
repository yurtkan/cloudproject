import 'package:flutter/material.dart';
import 'package:cloudproject_restaurant_app/src/view/screen/home_screen.dart';
import 'package:get/get.dart';
import 'package:cloudproject_restaurant_app/core/app_color.dart';
import '../../controller/food_controller.dart';

final FoodController controller = Get.put(FoodController());

@override
void initState() {}

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
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
                  table_button(
                    tableName: "1",
                  ),
                  table_button(
                    tableName: "2",
                  ),
                  table_button(
                    tableName: "3",
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  table_button(
                    tableName: "4",
                  ),
                  table_button(
                    tableName: "5",
                  ),
                  table_button(
                    tableName: "6",
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  table_button(
                    tableName: "7",
                  ),
                  table_button(
                    tableName: "8",
                  ),
                  table_button(
                    tableName: "9",
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  table_button(
                    tableName: "10",
                  ),
                  table_button(
                    tableName: "11",
                  ),
                  table_button(
                    tableName: "12",
                  ),
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
  }
}

// ignore: camel_case_types
class table_button extends StatelessWidget {
  final String tableName;
  const table_button({
    super.key,
    required this.tableName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
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
        child: Text(
          tableName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

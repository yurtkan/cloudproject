import 'dart:math';

import 'package:cloudproject_restaurant_app/src/controller/order_menu_controller.dart';
import 'package:get/get.dart';
//import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloudproject_restaurant_app/core/app_extension.dart';
import 'package:cloudproject_restaurant_app/src/controller/food_controller.dart';
import 'package:cloudproject_restaurant_app/src/view/widget/food_list_view.dart';
import 'package:get_storage/get_storage.dart';

final FoodController controller = Get.put(FoodController());
final OrderMenuController orderMenuController = Get.put(OrderMenuController());

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({Key? key}) : super(key: key);

  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  late String _uname = "Guest";

  @override
  void initState() {
    super.initState();
    _getUserName();
  }

  void _getUserName() {
    if (GetStorage().read('uname') != null) {
      _uname = GetStorage().read('uname');
    } else {
      _uname = "Guest";
    }
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(height: 20, 'assets/images/ncatlittle.png'),
          const SizedBox(width: 10),
          Text(
            "Nyan Cat Asian House",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.moon),
          onPressed: controller.changeTheme,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _getUserName();
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome $_uname,",
                style: Theme.of(context).textTheme.headlineSmall,
              ).fadeAnimation(0.2),
              Text(
                "What do you want to eat \ntoday?",
                style: Theme.of(context).textTheme.displayLarge,
              ).fadeAnimation(0.4),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 500,
                  child: GetBuilder(
                    builder: (FoodController controller) {
                      return FoodListView(foods: controller.filteredFoods);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

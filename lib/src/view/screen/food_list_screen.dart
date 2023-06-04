import 'dart:math';

import 'package:get/get.dart';
//import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloudproject_restaurant_app/core/app_extension.dart';
import 'package:cloudproject_restaurant_app/src/controller/food_controller.dart';
import 'package:cloudproject_restaurant_app/src/view/widget/food_list_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FoodController controller = Get.put(FoodController());

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

  _getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('uname') != null) {
      _uname = prefs.getString('uname')!;
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
                  // GetBuilder(
                  //   builder: (FoodController controller) {
                  //     return ListView.separated(
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: AppData.categories.length,
                  //       itemBuilder: (_, index) {
                  //         FoodCategory category = AppData.categories[index];
                  //         return GestureDetector(
                  //           onTap: () {
                  //             controller.filterItemByCategory(category);
                  //           },
                  //           child: Container(
                  //             width: 100,
                  //             alignment: Alignment.center,
                  //             padding: const EdgeInsets.all(10),
                  //             decoration: BoxDecoration(
                  //               color: category.isSelected
                  //                   ? LightThemeColor.accent
                  //                   : Colors.transparent,
                  //               borderRadius: const BorderRadius.all(
                  //                 Radius.circular(15),
                  //               ),
                  //             ),
                  //             child: Text(
                  //               category.type.name.toCapital,
                  //               style:
                  //                   Theme.of(context).textTheme.headlineMedium,
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //       separatorBuilder: (_, __) {
                  //         return const Padding(
                  //           padding: EdgeInsets.only(right: 15),
                  //         );
                  //       },
                  //     );
                  //   },
                  // ),
                ),
              ),
              // GetBuilder(
              //   builder: (FoodController controller) {
              //     return FoodListView(foods: controller.filteredFoods);
              //   },
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 25, bottom: 5),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         "Best food of the week",
              //         style: Theme.of(context).textTheme.displaySmall,
              //       ),
              //       // Padding(
              //       //   padding: const EdgeInsets.only(right: 20),
              //       //   child: Text(
              //       //     "See all",
              //       //     style: Theme.of(context)
              //       //         .textTheme
              //       //         .headlineMedium
              //       //         ?.copyWith(color: LightThemeColor.accent),
              //       //   ),
              //       // ),
              //     ],
              //   ),
              // ),
              //FoodListView(foods: AppData.foodItems, isReversedList: true),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cloudproject_restaurant_app/src/controller/order_menu_controller.dart';
import 'package:cloudproject_restaurant_app/src/controller/reservation_controller.dart';
import 'package:cloudproject_restaurant_app/src/view/screen/reservation_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloudproject_restaurant_app/core/app_data.dart';
import 'package:cloudproject_restaurant_app/src/view/screen/cart_screen.dart';
import 'package:cloudproject_restaurant_app/src/view/screen/profile_screen.dart';
import 'package:cloudproject_restaurant_app/src/controller/food_controller.dart';
import 'package:cloudproject_restaurant_app/src/view/screen/favorite_screen.dart';
import 'package:cloudproject_restaurant_app/src/view/widget/page_transition.dart';
import 'package:cloudproject_restaurant_app/src/view/screen/food_list_screen.dart';

final FoodController controller = Get.put(FoodController());
final OrderMenuController orderMenuController = Get.put(OrderMenuController());
final ReservationController reservationController =
    Get.put(ReservationController());

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Widget> screen = [
    const FoodListScreen(),
    const CartScreen(),
    const ReservationScreen(),
    const FavoriteScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    reservationController.getReservationItems();
    return Scaffold(
      body: Obx(
        () => PageTransition(
          child: screen[controller.currentBottomNavItemIndex.value],
        ),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.currentBottomNavItemIndex.value,
          onTap: controller.switchBetweenBottomNavigationItems,
          selectedFontSize: 0,
          items: AppData.bottomNavigationItems.map(
            (element) {
              return BottomNavigationBarItem(
                icon: element.disableIcon,
                label: element.label,
                activeIcon: element.enableIcon,
              );
            },
          ).toList(),
        );
      }),
    );
  }
}

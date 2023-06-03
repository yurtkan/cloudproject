import 'package:flutter/material.dart';
import 'package:cloudproject_restaurant_app/core/app_icon.dart';
import 'package:cloudproject_restaurant_app/core/app_asset.dart';
import 'package:cloudproject_restaurant_app/src/model/food.dart';
import 'package:cloudproject_restaurant_app/src/model/bottom_navigation_item.dart';

class AppData {
  const AppData._();

  static const dummyText = "mama";

  static List<Food> foodItems = [
    Food(
      AppAsset.sushi1,
      "Sushi1",
      10.0,
      1,
      false,
      dummyText,
    ),
    Food(
      AppAsset.sushi2,
      "Sushi2",
      15.0,
      1,
      false,
      dummyText,
    ),
    Food(
      AppAsset.sushi3,
      "Sushi3",
      20.0,
      1,
      false,
      dummyText,
    ),
    Food(
      AppAsset.sushi4,
      "Sushi4",
      40.0,
      1,
      false,
      dummyText,
    ),
    Food(
      AppAsset.sushi5,
      "Sushi5",
      10.0,
      1,
      false,
      dummyText,
    ),
    Food(
      AppAsset.sushi6,
      "Sushi6",
      20.0,
      1,
      false,
      dummyText,
    ),
    Food(
      AppAsset.sushi7,
      "Sushi7",
      12.0,
      1,
      false,
      dummyText,
    ),
    Food(
      AppAsset.sushi8,
      "Sushi8",
      30.0,
      1,
      false,
      dummyText,
    ),
    // Food(
    //   AppAsset.sushi9,
    //   "Sushi9",
    //   10.0,
    //   1,
    //   false,
    //   dummyText,
    //   5.0,
    //   FoodType.ramen,
    //   900,
    // ),
    // Food(
    //   AppAsset.sushi10,
    //   "Sushi10",
    //   15.0,
    //   1,
    //   false,
    //   dummyText,
    //   3.5,
    //   FoodType.ramen,
    //   420,
    // ),
    // Food(
    //   AppAsset.sushi11,
    //   "Sushi11",
    //   25.0,
    //   1,
    //   false,
    //   dummyText,
    //   3.0,
    //   FoodType.tempura,
    //   263,
    // ),
    // Food(
    //   AppAsset.sushi12,
    //   "Sushi12",
    //   20.0,
    //   1,
    //   false,
    //   dummyText,
    //   5.0,
    //   FoodType.tempura,
    //   560,
    // ),
  ];

  static List<BottomNavigationItem> bottomNavigationItems = [
    BottomNavigationItem(
      const Icon(Icons.home_outlined),
      const Icon(Icons.home),
      'Home',
      isSelected: true,
    ),
    BottomNavigationItem(
      const Icon(Icons.shopping_cart_outlined),
      const Icon(Icons.shopping_cart),
      'Shopping cart',
    ),
    BottomNavigationItem(
      const Icon(Icons.table_restaurant_outlined),
      const Icon(Icons.table_restaurant_rounded),
      'Reservation',
    ),
    BottomNavigationItem(
      const Icon(AppIcon.outlinedHeart),
      const Icon(AppIcon.heart),
      'Favorite',
    ),
    BottomNavigationItem(
      const Icon(Icons.person_outline),
      const Icon(Icons.person),
      'Profile',
    )
  ];
}

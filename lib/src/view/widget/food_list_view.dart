import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloudproject_restaurant_app/core/app_style.dart';
import 'package:cloudproject_restaurant_app/src/model/food.dart';
import 'package:cloudproject_restaurant_app/core/app_color.dart';
import 'package:cloudproject_restaurant_app/core/app_extension.dart';
import 'package:cloudproject_restaurant_app/src/controller/food_controller.dart';
import 'package:cloudproject_restaurant_app/src/view/screen/food_detail_screen.dart';
import 'package:cloudproject_restaurant_app/src/view/widget/custom_page_route.dart';

final FoodController controller = Get.put(FoodController());

class FoodListView extends StatelessWidget {
  const FoodListView({
    Key? key,
    required this.foods,
    this.isReversedList = false,
  }) : super(key: key);

  final List<Food> foods;
  final bool isReversedList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 10, right: 10),
        scrollDirection: Axis.vertical,
        itemCount: isReversedList ? 3 : foods.length,
        itemBuilder: (_, index) {
          Food food =
              isReversedList ? foods.reversed.toList()[index] : foods[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CustomPageRoute(child: FoodDetailScreen(food: food)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 160,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: controller.isLightTheme
                      ? Colors.white
                      : DarkThemeColor.primaryLight,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(food.image, scale: 6),
                        ],
                      ).fadeAnimation(0.7),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Image.asset(food.image, scale: 6),
                          Text(
                            food.name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$${food.price}",
                            style:
                                h3Style.copyWith(color: LightThemeColor.accent),
                          ),
                        ],
                      ).fadeAnimation(0.7),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) {
          return const Padding(padding: EdgeInsets.only(right: 50));
        },
      ),
    );
  }
}

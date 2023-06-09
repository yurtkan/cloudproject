import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloudproject_restaurant_app/core/app_icon.dart';
import 'package:cloudproject_restaurant_app/core/app_color.dart';
import 'package:cloudproject_restaurant_app/src/model/food.dart';
import 'package:cloudproject_restaurant_app/core/app_extension.dart';
import 'package:cloudproject_restaurant_app/src/view/widget/counter_button.dart';
import 'package:cloudproject_restaurant_app/src/controller/food_controller.dart';
import 'package:cloudproject_restaurant_app/src/view/widget/scale_animation.dart';

final FoodController controller = Get.put(FoodController());

class FoodDetailScreen extends StatelessWidget {
  const FoodDetailScreen({Key? key, required this.food}) : super(key: key);

  final Food food;

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Food Detail Screen",
        style: TextStyle(
          color: controller.isLightTheme ? Colors.black : Colors.white,
        ),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }

  Widget fab(VoidCallback onPressed) {
    return FloatingActionButton(
      elevation: 0.0,
      backgroundColor: LightThemeColor.accent,
      onPressed: onPressed,
      child: food.isFavorite
          ? const Icon(AppIcon.heart)
          : const Icon(AppIcon.outlinedHeart),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: _appBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton:
          GetBuilder(builder: (FoodController foodController) {
        return fab(() => foodController.isFavoriteFood(food));
      }),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: SizedBox(
          height: height * 0.5,
          child: Container(
            decoration: BoxDecoration(
              color: controller.isLightTheme
                  ? Colors.white
                  : DarkThemeColor.primaryLight,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${food.price}",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(color: LightThemeColor.accent),
                        ),
                        GetBuilder(
                          builder: (FoodController foodController) {
                            return CounterButton(
                              onIncrementSelected: () =>
                                  foodController.increaseItem(food),
                              onDecrementSelected: () =>
                                  foodController.decreaseItem(food),
                              label: Text(
                                food.quantity.toString(),
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            );
                          },
                        )
                      ],
                    ).fadeAnimation(0.6),
                    const SizedBox(height: 15),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.displayMedium,
                    ).fadeAnimation(0.8),
                    const SizedBox(height: 15),
                    Text(
                      food.description,
                      style: Theme.of(context).textTheme.titleMedium,
                    ).fadeAnimation(0.8),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                        child: ElevatedButton(
                          onPressed: () => {
                            controller.addToCart(food),
                            Navigator.of(context).pop(),
                          },
                          child: const Text("Add to cart"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: ScaleAnimation(
        child: Center(child: Image.network(food.image, scale: 2)),
      ),
    );
  }
}

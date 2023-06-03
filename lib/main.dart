import 'package:cloudproject_restaurant_app/src/view/screen/login_screen.dart';
import 'package:cloudproject_restaurant_app/src/view/screen/notfound_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:cloudproject_restaurant_app/src/view/screen/home_screen.dart';
import 'package:cloudproject_restaurant_app/src/controller/food_controller.dart';

final FoodController controller = Get.put(FoodController());

void main() {
  //runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      Obx(
        () {
          return GetMaterialApp(
            title: 'Nyan Cat Asian House',
            debugShowCheckedModeBanner: false,
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
              },
            ),
            theme: controller.theme.value,
            unknownRoute: GetPage(
              name: '/notfound',
              page: () => const NotFoundScreen(),
            ),
            initialRoute: '/login',
            getPages: [
              GetPage(
                name: '/login',
                page: () => const LoginScreen(),
              ),
              GetPage(
                name: '/home',
                page: () => HomeScreen(),
              ),
            ],
          );
        },
      ),
    ),
  );
}

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         scrollBehavior: const MaterialScrollBehavior().copyWith(
//           dragDevices: {
//             PointerDeviceKind.mouse,
//             PointerDeviceKind.touch,
//           },
//         ),
//         theme: controller.theme.value,
//         home: HomeScreen(),
//       );
//     });
//   }
// }

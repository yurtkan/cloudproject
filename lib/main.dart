import 'package:cloudproject_restaurant_app/src/controller/order_menu_controller.dart';
import 'package:cloudproject_restaurant_app/src/controller/reservation_controller.dart';
import 'package:cloudproject_restaurant_app/src/view/screen/login_screen.dart';
import 'package:cloudproject_restaurant_app/src/view/screen/not_connected.dart';
import 'package:cloudproject_restaurant_app/src/view/screen/notfound_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' show PointerDeviceKind;
import 'package:cloudproject_restaurant_app/src/view/screen/home_screen.dart';
import 'package:cloudproject_restaurant_app/src/controller/food_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

final OrderMenuController orderMenuController = Get.put(OrderMenuController());
final ReservationController reservationController =
    Get.put(ReservationController());
final FoodController controller = Get.put(FoodController());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final connectivityResult = await (Connectivity().checkConnectivity());
  String sroute;
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();

  String? token = GetStorage().read('token');
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    if (token == null) {
      sroute = '/login';
    } else {
      sroute = '/home';
    }
  } else {
    sroute = '/notconnected';
  }
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
            initialRoute: sroute,
            getPages: [
              GetPage(
                name: '/login',
                page: () => const LoginScreen(),
              ),
              GetPage(
                name: '/home',
                page: () => HomeScreen(),
              ),
              GetPage(
                name: '/notconnected',
                page: () => const NotConnectionScreen(),
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

import 'package:cloudproject_restaurant_app/src/view/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:cloudproject_restaurant_app/core/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/food_controller.dart';

final FoodController controller = Get.put(FoodController());

@override
void initState() {}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _uname = "Guest"; //User Name
  late String _mail = "guest@mail.com"; //User Mail

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  _getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('uname') != null) {
      _uname = prefs.getString('uname')!;
    }
    if (prefs.getString('mail') != null) {
      _mail = prefs.getString('mail')!;
    }
  }

  _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(() => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
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
              // logout button
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FaIcon(FontAwesomeIcons.rightFromBracket),
                      Text("Logout"),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  onPressed: () {
                    _logout();
                  },
                ),
              ),
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

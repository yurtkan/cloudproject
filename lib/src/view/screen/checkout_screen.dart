//import 'package:cloudproject_restaurant_app/src/view/screen/food_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloudproject_restaurant_app/src/view/screen/home_screen.dart';
//import 'package:cloudproject_restaurant_app/src/view/screen/sign_up.dart';
import 'package:get/get.dart';

//import 'home_screen.dart';

final _cityController = TextEditingController();
final _townController = TextEditingController();
final _addressController = TextEditingController();

@override
void initState() {}

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                //end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 244, 236, 245),
                  Color.fromARGB(255, 188, 178, 194),
                  Color.fromARGB(255, 200, 171, 204),
                  Color.fromARGB(255, 215, 187, 223),
                  Color.fromARGB(255, 207, 181, 219),
                  Color.fromARGB(255, 220, 199, 221),
                ],
              ),
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(40),
              //   topRight: Radius.circular(40),
              // ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  // const Text('Where should we bring your order?',
                  //     textAlign: TextAlign.left,
                  //     style: TextStyle(
                  //       color: Color.fromARGB(255, 0, 0, 0),
                  //       fontSize: 30,
                  //     )),
                  const SizedBox(
                    height: 40,
                  ),
                  const Image(
                    image: AssetImage('assets/images/Kawaii Cats In Box.gif'),
                    height: 150,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: _cityController,
                    onChanged: (text) {
                      setState(() {
                        _cityController.text;
                      });
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.purple),
                    decoration: const InputDecoration(
                      labelText: "City",
                      labelStyle: TextStyle(color: Colors.purple),
                      // prefixIcon: Icon(Icons.home_filled),
                      // prefixIconColor: Colors.purple,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _townController,
                    onChanged: (text) {
                      setState(() {
                        _cityController.text;
                      });
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.purple),
                    decoration: const InputDecoration(
                      labelText: "Town",
                      labelStyle: TextStyle(color: Colors.purple),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _addressController,
                    onChanged: (text) {
                      setState(() {
                        _addressController.text;
                      });
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.purple),
                    decoration: const InputDecoration(
                      labelText: "Address",
                      labelStyle: TextStyle(color: Colors.purple),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 45,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor:
                            const Color.fromARGB(255, 101, 101, 101),
                        backgroundColor:
                            const Color.fromARGB(255, 239, 239, 239),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_cityController.text.isEmpty) {
                          //city field is empty
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                    "City info cannot be empty",
                                    style: TextStyle(color: Colors.deepPurple),
                                  ),
                                  backgroundColor: Colors.white,
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        "Okay",
                                        style: TextStyle(color: Colors.purple),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        } else if (_townController.text.isEmpty) {
                          //pswrd is empty
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                    "Town info cannot be empty",
                                    style: TextStyle(color: Colors.deepPurple),
                                  ),
                                  backgroundColor: Colors.white,
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        "Okay",
                                        style: TextStyle(color: Colors.purple),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        } else if (_addressController.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                    "Address info cannot be empty",
                                    style: TextStyle(color: Colors.deepPurple),
                                  ),
                                  backgroundColor: Colors.white,
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        "Okay",
                                        style: TextStyle(color: Colors.purple),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        }
                        // else if(){
                        //   //pswrd or mail is incorrect
                        // }
                        else {
                          //everything is ok
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                    "Your order is confirmed!",
                                    style: TextStyle(color: Colors.purple),
                                  ),
                                  content: const Text(
                                    "We sent you a confirmation e-mail.",
                                    style: TextStyle(color: Colors.purple),
                                  ),
                                  backgroundColor: Colors.white,
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text(
                                        "Okay",
                                        style: TextStyle(color: Colors.purple),
                                      ),
                                      onPressed: () {
                                        Get.to(HomeScreen());
                                      },
                                    )
                                  ],
                                );
                              });
                        }
                      },
                      child: const Text('Order'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

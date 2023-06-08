import 'package:cloudproject_restaurant_app/src/controller/food_controller.dart';
import 'package:cloudproject_restaurant_app/src/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final OrderController orderController = Get.put(OrderController());
final FoodController foodController = Get.put(FoodController());

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: TextStyle(
            color: foodController.isLightTheme ? Colors.black : Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/images/giphy.gif'),
                    height: 150,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Where we should bring your order?",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: orderController.cityfield,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please provide city information';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 18,
                    ),
                    decoration: const InputDecoration(
                      labelText: "City",
                      labelStyle: TextStyle(color: Colors.purple),
                      prefixIcon: Icon(Icons.location_city),
                      prefixIconColor: Colors.purple,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: orderController.townfield,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please provide town information';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.purple, fontSize: 18),
                    decoration: const InputDecoration(
                      labelText: "Town",
                      labelStyle: TextStyle(color: Colors.purple),
                      prefixIcon: Icon(Icons.domain),
                      prefixIconColor: Colors.purple,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: orderController.adressfield,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please provide adress information';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.purple, fontSize: 18),
                    decoration: const InputDecoration(
                      labelText: "Adress",
                      labelStyle: TextStyle(color: Colors.purple),
                      prefixIcon: Icon(Icons.pin_drop),
                      prefixIconColor: Colors.purple,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 45,
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
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
                        if (_formKey.currentState!.validate()) {
                          _setorders();
                        } else {
                          Get.snackbar('Please fill all the fields',
                              'Adress Infotmations is required',
                              colorText: Colors.white,
                              backgroundColor: Colors.red);
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

  void _setorders() {
    Map<String, int> carti = {};
    for (int i = 0; i < foodController.cartFood.length; i++) {
      String keyid = '"${foodController.cartFood[i].dbid}"';
      int valueid = foodController.cartFood[i].quantity;
      carti.addAll(
        {
          keyid: valueid,
        },
      );
    }
    orderController.orderAPI(carti);
    print(carti);
  }
}

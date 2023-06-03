// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloudproject_restaurant_app/src/view/screen/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloudproject_restaurant_app/src/controller/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool _passwordVisible = false;

void initState() {
  _passwordVisible = false;
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 200,
                      child: const Image(
                        image: AssetImage('assets/images/icegif-379.gif'),
                        fit: BoxFit.cover,
                        alignment: Alignment.centerRight,
                        //height: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: const Text(
                        'Nyan Cat \nAsian House',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 37,
              ),
              Container(
                width: double.infinity,
                //height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 112, 5, 126),
                      Color.fromARGB(255, 152, 25, 226),
                      Color.fromARGB(255, 205, 21, 230),
                      Color.fromARGB(255, 184, 35, 221),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    // topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 252, 252, 252),
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Please Login to Your Account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 252, 252, 252),
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            controller: controller.loginfield,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please provide the mail';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                              color: Colors.purple,
                              fontSize: 18,
                            ),
                            decoration: const InputDecoration(
                              labelText: "Mail",
                              labelStyle: TextStyle(color: Colors.purple),
                              prefixIcon: Icon(Icons.mail),
                              prefixIconColor: Colors.purple,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 25),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            controller: controller.passwordfield,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please provide the password';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            obscureText: !_passwordVisible,
                            style: const TextStyle(
                                color: Colors.purple, fontSize: 18),
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: const TextStyle(color: Colors.purple),
                              prefixIcon: const Icon(Icons.key),
                              prefixIconColor: Colors.purple,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.purple,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 25),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 25),
                              ),
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
                                foregroundColor: Color.fromARGB(255, 0, 0, 0),
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
                                  controller.loginAPI();
                                } else {
                                  Get.snackbar('Please fill all the fields',
                                      'Email and Pasword are required',
                                      colorText: Colors.white,
                                      backgroundColor: Colors.red);
                                }
                              },
                              child: const Text('Login'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50, bottom: 10),
                            child: Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Color.fromARGB(255, 252, 252, 252),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            width: 250,
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
                                Get.to(() => const SignUpScreen());
                              },
                              child: const Text('Sign Up'),
                            ),
                          ),
                          SizedBox(
                            height: 48,
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

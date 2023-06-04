// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloudproject_restaurant_app/src/view/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloudproject_restaurant_app/src/controller/register_controller.dart';

bool _passwordVisible = false;

void initState() {
  _passwordVisible = false;
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterController controller = Get.put(RegisterController());
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
                            "Register",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 252, 252, 252),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            controller: controller.unamefield,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please provide the Name Surname';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            style: const TextStyle(
                              color: Colors.purple,
                              fontSize: 18,
                            ),
                            decoration: const InputDecoration(
                              labelText: "Name Surname",
                              labelStyle: TextStyle(color: Colors.purple),
                              prefixIcon: Icon(Icons.person),
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
                            height: 30,
                          ),
                          TextFormField(
                            controller: controller.registerfield,
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
                            height: 30,
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
                            height: 30,
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
                                  controller.registerAPI();
                                } else {
                                  Get.snackbar('Please fill all the fields',
                                      'Email and Pasword are required',
                                      colorText: Colors.white,
                                      backgroundColor: Colors.red);
                                }
                              },
                              child: const Text('Sign Up'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10),
                            child: Text(
                              "Have an account?",
                              style: TextStyle(
                                color: Color.fromARGB(255, 252, 252, 252),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            width: 200,
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
                                Get.offAll(() => const LoginScreen());
                              },
                              child: const Text('Login'),
                            ),
                          ),
                          SizedBox(
                            height: 42,
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

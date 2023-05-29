import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

bool _passwordVisible = false;

@override
void initState() {
  _passwordVisible = false;
  // FlutterGifController controller= FlutterGifController(vsync: this);
  // moveFiles();
  // super.initState();
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                  Color.fromARGB(255, 112, 5, 126),
                  Color.fromARGB(255, 152, 25, 226),
                  Color.fromARGB(255, 205, 21, 230),
                  Color.fromARGB(255, 184, 35, 221),
                  Color.fromARGB(255, 160, 29, 221),
                  Color.fromARGB(255, 211, 27, 218),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  const Text('Sign Up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 40,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  const Image(
                    image: AssetImage('assets/images/icegif-379.gif'),
                    height: 150,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.purple),
                    decoration: const InputDecoration(
                      labelText: "Name Surname",
                      labelStyle: TextStyle(color: Colors.purple),
                      prefixIcon: Icon(Icons.account_circle),
                      prefixIconColor: Colors.purple,
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
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.purple),
                    decoration: const InputDecoration(
                      labelText: "Mail",
                      labelStyle: TextStyle(color: Colors.purple),
                      prefixIcon: Icon(Icons.mail),
                      prefixIconColor: Colors.purple,
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
                    keyboardType: TextInputType.text,
                    obscureText: !_passwordVisible,
                    style: const TextStyle(color: Colors.purple),
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: const TextStyle(color: Colors.purple),
                      prefixIcon: const Icon(Icons.key),
                      prefixIconColor: Colors.purple,
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                        Get.to(HomeScreen());
                      },
                      child: const Text('Sign Up'),
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

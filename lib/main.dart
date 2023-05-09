import 'package:flutter/material.dart';
import 'package:cloudproject/app/app.dart';
import 'package:cloudproject/app/tabs/home/details/details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Cera Pro",
        primaryColor: Color(0xFFE85852),
      ),
      routes: {
        'details': (context) => Details(),
      },
      home: App(),
    );
  }
}

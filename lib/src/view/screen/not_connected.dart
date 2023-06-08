import 'package:flutter/material.dart';

class NotConnectionScreen extends StatelessWidget {
  const NotConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Not Connected to Internet"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off, size: 100),
            Text("You are not connected to the internet"),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloudproject_restaurant_app/core/app_asset.dart';

import 'login_page.dart';

final _nameEdit = TextEditingController();
// ignore: unused_element
final _mailEdit = TextEditingController();
// ignore: unused_element
final _passwordEdit = TextEditingController();

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Image.asset(AppAsset.profileImage, width: 50),
          ),
          Text(
            "Hello!",
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: TextFormField(
                            controller: _nameEdit,
                            onChanged: (text) {
                              setState(() {
                                _nameEdit.text;
                              });
                              user.setName(_nameEdit.text.toString());
                            },
                            keyboardType: TextInputType.text,
                            style: const TextStyle(color: Colors.purple),
                            decoration: const InputDecoration(
                              labelText: "Enter your name and surname",
                              labelStyle: TextStyle(color: Colors.purple),
                              prefixIconColor: Colors.purple,
                            ),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 240, 238, 238),
                          actions: <Widget>[
                            TextButton(
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Colors.purple),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
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
                  //print('The container is tapped');
                  // Add other stuff
                },
                child: Container(
                  height: 30.0,
                  width: 200.0,
                  //alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 224, 178, 194),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text(
                    "name surname",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),

                // color: Colors.purple,
                // child: const Text(
                //     /* "$nameInfo"*/
                //     "name info"),
              )
            ],
          )
        ],
      ),
    );
  }
}

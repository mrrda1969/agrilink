import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 135, 20),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        // centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 210, 230, 215),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
      ),
      backgroundColor: const Color.fromARGB(255, 210, 230, 215),
      body: ListView(children: const [
        //profile image
        Padding(
          padding: EdgeInsets.all(20.0),
          child: CircleAvatar(
            radius: 70,
            backgroundColor: Color.fromARGB(255, 210, 230, 215),
            child: Icon(
              Icons.settings,
              color: Colors.black,
              size: 100,
            ),
          ),
        ),
        
      ]),
    );
  }
}
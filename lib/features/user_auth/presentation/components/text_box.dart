import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  const MyTextBox({super.key, required this.text, required this.sectionName});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(
          left: 15,
          bottom: 15,
        ),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(sectionName, style: const TextStyle(color: Colors.black)),
                //edit button
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                  color: Colors.grey[400],
                ),
              ],
            ),
            Text(text, style: const TextStyle(color: Colors.black)),
          ],
        ));
  }
}

import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'No chats available',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
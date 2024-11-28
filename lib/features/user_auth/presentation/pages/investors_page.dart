import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:agrilink/features/user_auth/presentation/components/squares.dart';

class InvestorsPage extends StatefulWidget {
  const InvestorsPage({super.key});

  @override
  State<InvestorsPage> createState() => _InvestorsPageState();
}

class _InvestorsPageState extends State<InvestorsPage> {
  final user = FirebaseAuth.instance.currentUser!;

  //sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Investors",
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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            MySquare(),
            MySquare(),
            MySquare(),
            MySquare(),
            MySquare(),
          ],
        ),
      ),
    );
  }
}

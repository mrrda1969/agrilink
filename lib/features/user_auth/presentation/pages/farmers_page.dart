import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:agrilink/features/user_auth/presentation/pages/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FarmersPage extends StatefulWidget {
  const FarmersPage({super.key});

  @override
  State<FarmersPage> createState() => _FamersPageState();
}

class _FamersPageState extends State<FarmersPage> {
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Conversation",
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
      body: _buildUserList(),
    );
  }

  //build user list
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('loading ....');
        }
        //padding: const EdgeInsets.only(top: 16.0);

        return ListView(
          children: snapshot.data!.docs
              .map<Widget>((doc) => _buildUserListItem(doc))
              .toList(),
        );
      },
    );
  }

  //build user list item
  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    // display all users except the current user
    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        title: Text(data['username']),
        onTap: () {
          //go to chat page with the user
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverUserEmail: data['email'],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}

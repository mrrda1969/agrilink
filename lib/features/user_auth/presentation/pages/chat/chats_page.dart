import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:agrilink/features/user_auth/presentation/pages/chat/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
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
          "Chats",
        ),
        // centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: _buildUserList(),
    );
  }

  //build user list
  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error loading users');
        }
        if (!snapshot.hasData) {
          return const Center(
              child: CircularProgressIndicator()); // Show loading indicator
        }

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

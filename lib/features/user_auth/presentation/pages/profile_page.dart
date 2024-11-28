import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:agrilink/features/user_auth/presentation/pages/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? currentUser = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load current user data into the controllers
    if (currentUser != null) {
      _loadUserData(); // Fetch actual user data from Firestore
    }
  }

  void _loadUserData() async {
    DocumentSnapshot userDoc =
        await _fireStore.collection('Users').doc(currentUser!.uid).get();
    if (userDoc.exists) {
      usernameController.text =
          userDoc['username'] ?? ''; // Fetch actual username
      phoneController.text =
          userDoc['phone'] ?? ''; // Fetch actual phone number
      bioController.text = userDoc['bio'] ?? ''; // Fetch actual bio
    }
  }

  void saveProfile() async {
    if (currentUser != null) {
      await _fireStore.collection('Users').doc(currentUser!.uid).update({
        'username': usernameController.text,
        'phone': phoneController.text,
        'bio': bioController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 135, 20),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 210, 230, 215),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
      ),
      backgroundColor: const Color.fromARGB(255, 210, 230, 215),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundColor: Color.fromARGB(255, 210, 230, 215),
              child: Icon(
                Icons.person,
                color: Colors.black,
                size: 100,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: bioController,
              decoration: const InputDecoration(
                labelText: 'Bio',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveProfile,
              child: const Text('Save Changes'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      receiverUserEmail: currentUser!.email!,
                    ),
                  ),
                );
              },
              child: const Text(
                'Chat Now',
                style: TextStyle(color: Color.fromARGB(255, 76, 0, 255)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

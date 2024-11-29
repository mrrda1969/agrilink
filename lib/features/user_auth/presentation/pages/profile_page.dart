import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User? currentUser = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  Map<String, dynamic>? userData;
  bool isEditing = false;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  String selectedRole = 'Investor';
  final List<String> roles = ['Investor', 'Farmer'];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    if (currentUser != null) {
      final doc = await _fireStore.collection('Users').doc(currentUser!.uid).get();
      if (doc.exists) {
        setState(() {
          userData = doc.data();
          usernameController.text = userData?['username'] ?? '';
          phoneController.text = userData?['phone'] ?? '';
          bioController.text = userData?['bio'] ?? '';
          selectedRole = userData?['role'] ?? 'Investor';
        });
      }
    }
  }

  Future<void> _saveProfile() async {
    if (currentUser != null) {
      await _fireStore.collection('Users').doc(currentUser!.uid).update({
        'username': usernameController.text,
        'phone': phoneController.text,
        'bio': bioController.text,
        'role': selectedRole,
      });
      setState(() {
        isEditing = false;
      });
      _loadUserData();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully!')),
        );
      }
    }
  }

  Widget _buildInfoField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (userData == null) {
      return const Center(child: CircularProgressIndicator());
    }

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
        actions: [
          if (!isEditing)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => setState(() => isEditing = true),
            )
          else
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _saveProfile,
            ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 210, 230, 215),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person, size: 50),
              ),
            ),
            const SizedBox(height: 24),
            if (isEditing) ...[
              _buildEditableField('Username', usernameController),
              _buildEditableField('Phone', phoneController),
              _buildEditableField('Bio', bioController),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: DropdownButtonFormField<String>(
                  value: selectedRole,
                  decoration: const InputDecoration(
                    labelText: 'Role',
                    border: OutlineInputBorder(),
                  ),
                  items: roles.map((String role) {
                    return DropdownMenuItem(
                      value: role,
                      child: Text(role),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedRole = newValue;
                      });
                    }
                  },
                ),
              ),
            ] else ...[
              _buildInfoField('Username', userData?['username'] ?? 'Not specified'),
              _buildInfoField('Email', currentUser?.email ?? 'Not specified'),
              _buildInfoField('Phone', userData?['phone'] ?? 'Not specified'),
              _buildInfoField('Bio', userData?['bio'] ?? 'Not specified'),
              _buildInfoField('Role', userData?['role'] ?? 'Not specified'),
            ],
          ],
        ),
      ),
    );
  }
}
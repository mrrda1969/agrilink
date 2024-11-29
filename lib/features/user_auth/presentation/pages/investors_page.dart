import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/chat_page.dart';

class InvestorsPage extends StatefulWidget {
  const InvestorsPage({super.key});

  @override
  State<InvestorsPage> createState() => _InvestorsPageState();
}

class _InvestorsPageState extends State<InvestorsPage> {
  final user = FirebaseAuth.instance.currentUser!;
  String? userRole;

  @override
  void initState() {
    super.initState();
    _loadUserRole();
  }

  Future<void> _loadUserRole() async {
    final userData = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .get();
    if (mounted) {
      setState(() {
        userRole = userData.data()?['role'];
      });
    }
  }

  Widget _buildInvestorCard(Map<String, dynamic> investorData) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: const Icon(Icons.person),
        ),
        title: Text(investorData['username'] ?? 'Anonymous'),
        subtitle: Text(investorData['bio'] ?? 'No bio available'),
        trailing: IconButton(
          icon: const Icon(Icons.message),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  receiverUserEmail: investorData['email'],
                ),
              ),
            );
          },
        ),
      ),
    );
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
        backgroundColor: const Color.fromARGB(255, 210, 230, 215),
      ),
      backgroundColor: const Color.fromARGB(255, 210, 230, 215),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .where('role', isEqualTo: 'Investor')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final investors = snapshot.data!.docs;

          if (investors.isEmpty) {
            return const Center(child: Text('No investors found'));
          }

          return ListView.builder(
            itemCount: investors.length,
            itemBuilder: (context, index) {
              final investorData =
                  investors[index].data() as Map<String, dynamic>;
              return _buildInvestorCard(investorData);
            },
          );
        },
      ),
    );
  }
}
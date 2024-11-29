import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/post_model.dart';
import '../models/investment_model.dart';
import '../pages/chat_page.dart';

class PostDetailPage extends StatefulWidget {
  final Post post;

  const PostDetailPage({super.key, required this.post});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  String? userRole;
  String? farmerUsername;

  @override
  void initState() {
    super.initState();
    _loadUserRole();
    _loadFarmerUsername();
  }

  Future<void> _loadUserRole() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
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
  }

  Future<void> _loadFarmerUsername() async {
    final farmerData = await FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.post.userId)
        .get();
    if (mounted) {
      setState(() {
        farmerUsername = farmerData.data()?['username'];
      });
    }
  }

  Future<void> _showInvestmentDialog(BuildContext context) async {
    if (userRole != 'Investor') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Only investors can make investments'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final amountController = TextEditingController();
    final notesController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Make Investment'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount (\$)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: notesController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Notes (Optional)',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (amountController.text.isEmpty) return;

              final currentUser = FirebaseAuth.instance.currentUser;
              if (currentUser == null) return;

              final amount = double.parse(amountController.text);

              // Create investment
              final investment = Investment(
                id: '',
                investorId: currentUser.uid,
                farmerId: widget.post.userId,
                postId: widget.post.id,
                amount: amount,
                status: 'pending',
                createdAt: DateTime.now(),
                notes: notesController.text,
              );

              // Start a transaction
              await FirebaseFirestore.instance.runTransaction((transaction) async {
                // Get the post document
                final postDoc = await transaction.get(FirebaseFirestore.instance
                    .collection('posts')
                    .doc(widget.post.id));

                if (!postDoc.exists) {
                  throw Exception('Post does not exist!');
                }

                // Update the current funding
                final currentFunding = postDoc.data()?['currentFunding'] ?? 0.0;
                transaction.update(postDoc.reference, {
                  'currentFunding': currentFunding + amount,
                });

                // Add the investment
                await FirebaseFirestore.instance
                    .collection('investments')
                    .add(investment.toMap());
              });

              if (mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Investment request sent successfully'),
                  ),
                );
              }
            },
            child: const Text('Invest'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title),
        backgroundColor: const Color.fromARGB(255, 141, 201, 170),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.post.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Category: ${widget.post.category}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Location: ${widget.post.location}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: widget.post.currentFunding / widget.post.fundingGoal,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(255, 90, 147, 93),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Goal: \$${widget.post.fundingGoal.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Current: \$${widget.post.currentFunding.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _showInvestmentDialog(context),
                  icon: const Icon(Icons.attach_money),
                  label: const Text('Invest Now'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 90, 147, 93),
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (farmerUsername != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatPage(
                            receiverUserEmail: farmerUsername!,
                          ),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.chat),
                  label: const Text('Contact Farmer'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 141, 201, 170),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
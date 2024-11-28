import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/investment_model.dart';
import '../models/post_model.dart';

class InvestmentManagementPage extends StatelessWidget {
  const InvestmentManagementPage({super.key});

  Future<Post?> _getPost(String postId) async {
    final doc =
        await FirebaseFirestore.instance.collection('posts').doc(postId).get();
    if (doc.exists) {
      return Post.fromMap(doc.data()!, doc.id);
    }
    return null;
  }

  Future<void> _updateInvestmentStatus(
      String investmentId, String newStatus) async {
    await FirebaseFirestore.instance
        .collection('investments')
        .doc(investmentId)
        .update({'status': newStatus});
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Investments',
            style: TextStyle(
              color: Color.fromARGB(255, 0, 135, 20),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 210, 230, 215),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'My Investments'),
              Tab(text: 'Investment Requests'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // My Investments Tab
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('investments')
                  .where('investorId', isEqualTo: currentUser?.uid)
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final investments = snapshot.data?.docs ?? [];

                return ListView.builder(
                  itemCount: investments.length,
                  itemBuilder: (context, index) {
                    final investment = Investment.fromMap(
                      investments[index].data() as Map<String, dynamic>,
                      investments[index].id,
                    );

                    return FutureBuilder<Post?>(
                      future: _getPost(investment.postId),
                      builder: (context, postSnapshot) {
                        final post = postSnapshot.data;

                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(post?.title ?? 'Loading...'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Amount: \$${investment.amount.toStringAsFixed(2)}'),
                                Text('Status: ${investment.status}'),
                                Text('Date: ${investment.createdAt.toLocal()}'),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),

            // Investment Requests Tab
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('investments')
                  .where('farmerId', isEqualTo: currentUser?.uid)
                  .where('status', isEqualTo: 'pending')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final requests = snapshot.data?.docs ?? [];

                return ListView.builder(
                  itemCount: requests.length,
                  itemBuilder: (context, index) {
                    final investment = Investment.fromMap(
                      requests[index].data() as Map<String, dynamic>,
                      requests[index].id,
                    );

                    return FutureBuilder<Post?>(
                      future: _getPost(investment.postId),
                      builder: (context, postSnapshot) {
                        final post = postSnapshot.data;

                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(post?.title ?? 'Loading...'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Amount: \$${investment.amount.toStringAsFixed(2)}'),
                                if (investment.notes != null &&
                                    investment.notes!.isNotEmpty)
                                  Text('Notes: ${investment.notes}'),
                                Text('Date: ${investment.createdAt.toLocal()}'),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.check,
                                      color: Colors.green),
                                  onPressed: () => _updateInvestmentStatus(
                                      investment.id, 'accepted'),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close,
                                      color: Colors.red),
                                  onPressed: () => _updateInvestmentStatus(
                                      investment.id, 'rejected'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

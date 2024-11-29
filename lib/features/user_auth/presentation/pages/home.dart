import 'package:agrilink/features/user_auth/presentation/components/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/post_model.dart';
import 'post_detail_page.dart';
import 'profile_page.dart';
import 'setting_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void goToProfilePage() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }

  void goToSettingsPage() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingPage()),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search projects...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (value) {
          setState(() {
            searchQuery = value;
          });
        },
      ),
    );
  }

  Widget _buildProjectSection(String title, Query<Map<String, dynamic>> query) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: StreamBuilder<QuerySnapshot>(
            stream: query.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final posts = snapshot.data!.docs
                  .map((doc) => Post.fromMap(
                      doc.data() as Map<String, dynamic>, doc.id))
                  .where((post) => post.title
                      .toLowerCase()
                      .contains(searchQuery.toLowerCase()))
                  .toList();

              if (posts.isEmpty) {
                return const Center(child: Text('No projects found'));
              }

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PostDetailPage(post: post),
                          ),
                        );
                      },
                      child: Container(
                        width: 250,
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              post.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            LinearProgressIndicator(
                              value: post.currentFunding / post.fundingGoal,
                              backgroundColor: Colors.grey[300],
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Color.fromARGB(255, 90, 147, 93),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Goal: \$${post.fundingGoal.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final recentProjectsQuery = FirebaseFirestore.instance
        .collection('posts')
        .orderBy('createdAt', descending: true)
        .limit(10);

    final trendingProjectsQuery = FirebaseFirestore.instance
        .collection('posts')
        .orderBy('currentFunding', descending: true)
        .limit(10);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
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
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      drawer: MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOut: signUserOut,
        onSettingsTap: goToSettingsPage,
      ),
      backgroundColor: const Color.fromARGB(255, 210, 230, 215),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            _buildProjectSection('Recent Projects', recentProjectsQuery),
            _buildProjectSection('Trending Projects', trendingProjectsQuery),
          ],
        ),
      ),
    );
  }
}
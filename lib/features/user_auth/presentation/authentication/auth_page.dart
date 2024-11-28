import 'package:agrilink/features/user_auth/login_or_register_page.dart';
//import 'package:demo_app/features/user_auth/presentation/pages/home.dart';
import 'package:agrilink/features/user_auth/presentation/widgets/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user is logged in
            if (snapshot.hasData) {
              return const NavigationMenu();
            }

            // user is Not Logged in
            else {
              return const LoginOrRegisterPage();
            }
          }),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:agrilink/features/user_auth/presentation/widgets/my_button.dart';
import 'package:agrilink/features/user_auth/presentation/widgets/my_textfield.dart';
import 'package:agrilink/features/user_auth/presentation/widgets/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // sign user in method
  void signUserUp() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // try signing in the user

    try {
      // check if the passwords match
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        // create a user document and add to firestore
        _fireStore.collection('Users').doc(usernameController.text).set({
          'username': usernameController.text,
          'email': emailController.text,
        });
        Navigator.pop(context);
      } else {
        // pop the loading circle
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        //show error message, password do not match
        showErrorMessage('Passwords do not match!');
      }
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.code);
    }
  }

  // wrong email message popup
  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 185, 214, 190),
            title: Center(
                child: Text(
              message,
              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                // logo
                Image.asset("assets/images/logo1.png", height: 150, width: 100),

                const SizedBox(height: 10),

                // lets create an account for you
                Text(
                  'Let\'s create an account for you',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                // user email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 20),

                // sign in button
                MyButton(
                  text: "Sign Up",
                  onTap: signUserUp,
                ),

                const SizedBox(height: 30),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // google + apple sign in buttons
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(imagePath: 'assets/images/app.png'),

                    SizedBox(width: 15),

                    // apple button
                    SquareTile(imagePath: 'assets/images/apple.png')
                  ],
                ),

                const SizedBox(height: 20),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login Now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

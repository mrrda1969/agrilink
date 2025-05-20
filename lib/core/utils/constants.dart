import 'package:flutter/material.dart';

class AppConstants {
  // Colors
  static const primaryColor = Color.fromARGB(255, 90, 147, 93);
  static const secondaryColor = Color.fromARGB(255, 141, 201, 170);
  static const backgroundColor = Color.fromARGB(255, 210, 230, 215);
  
  // Text Styles
  static const headerStyle = TextStyle(
    color: Color.fromARGB(255, 0, 135, 20),
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  
  // Padding & Margins
  static const defaultPadding = EdgeInsets.all(16.0);
  static const defaultMargin = EdgeInsets.all(8.0);
  
  // Routes
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String profileRoute = '/profile';
  
  // Firebase Collections
  static const String usersCollection = 'Users';
  static const String postsCollection = 'posts';
  static const String investmentsCollection = 'investments';
  static const String messagesCollection = 'messages';
}
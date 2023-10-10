import 'package:flutter/material.dart';
import 'UserProfileScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserProfileScreen(mobile: '5858585858',), // Set your initial screen here
    );
  }
}

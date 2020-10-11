import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'LoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(PoYiGame());
}

class PoYiGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go',
      theme: new ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: LoginPage(),
    );
  }
}

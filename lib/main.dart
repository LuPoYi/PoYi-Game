import 'package:flutter/material.dart';
import 'LoginPage.dart';

void main() => runApp(PoYiGame());

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

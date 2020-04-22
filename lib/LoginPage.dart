import 'package:flutter/material.dart';
import 'MineSweeper.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new MineSweeper()));
        },
        padding: EdgeInsets.all(12),
        color: Color.fromRGBO(64, 75, 96, .9),
        child: Text("Game", style: TextStyle(color: Colors.white)),
      ),
    );

    // 3d
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[loginButton],
        ),
      ),
    );
  }
}

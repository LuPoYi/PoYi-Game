import 'package:flutter/material.dart';
import './services/firebase.dart';

class BullsCows extends StatefulWidget {
  BullsCows({Key key}) : super(key: key);

  @override
  _BullsCowsState createState() => _BullsCowsState();
}

class _BullsCowsState extends State<BullsCows> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Text("2A1B"),
        MaterialButton(onPressed: () {
          FirebaseService.createOrder();
        }),
        Text("CCCC"),
      ],
    ));
  }
}

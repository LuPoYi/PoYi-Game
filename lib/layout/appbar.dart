import 'package:flutter/material.dart';

Widget buildAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(title),
    backgroundColor: Colors.black,
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.add_alert),
        onPressed: () {},
      )
    ],
  );
}

import 'package:flutter/material.dart';

Widget buildFloatingActionButton(BuildContext context, Function resetBoard) {
  return FloatingActionButton(
    onPressed: () {
      resetBoard();
    },
    tooltip: '重玩',
    child: Icon(Icons.refresh),
  );
}

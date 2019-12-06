import 'package:flutter/material.dart';
import 'package:poyi_game/MineSweeper.dart';
import 'package:poyi_game/TicTacToe.dart';

Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text(
            'Game List',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.black54,
          ),
        ),
        ListTile(
          title: Text('Tic Tac Toe!'),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new TicTacToe()));
          },
        ),
        ListTile(
          title: Text('Mine Sweeper!'),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new MineSweeper()));
          },
        ),
      ],
    ),
  );
}

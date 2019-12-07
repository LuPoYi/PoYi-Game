import 'package:flutter/material.dart';
import 'package:poyi_game/TicTacToe.dart';
import 'package:poyi_game/MineSweeper.dart';
import 'package:poyi_game/Tetris.dart';
import 'package:poyi_game/Snake.dart';

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
                new MaterialPageRoute(builder: (context) => MineSweeper()));
          },
        ),
        ListTile(
          title: Text('Tetris!'),
          onTap: () {
            Navigator.push(
                context, new MaterialPageRoute(builder: (context) => Tetris()));
          },
        ),
        ListTile(
          title: Text('Snake!'),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new Snake()));
          },
        ),
      ],
    ),
  );
}

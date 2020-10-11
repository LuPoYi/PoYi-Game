import 'package:flutter/material.dart';
import 'package:poyi_game/TicTacToe.dart';
import 'package:poyi_game/MineSweeper.dart';
import 'package:poyi_game/Tetris.dart';
import 'package:poyi_game/Snake.dart';
import 'package:poyi_game/Sensor.dart';
import 'package:poyi_game/BullsCows.dart';

final List<dynamic> listTiles = [
  ['Tic Tac Toe!', new TicTacToe()],
  ['Mine Sweeper!', new MineSweeper()],
  ['Tetris', new Tetris()],
  ['Snake!', new Snake()],
  ['Sensor!', new Sensor()],
  ['2A1B!', new BullsCows()],
];

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
        ...listTiles
            .map((item) => new ListTile(
                  title: Text(item[0]),
                  onTap: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => item[1]));
                  },
                ))
            .toList(),
      ],
    ),
  );
}

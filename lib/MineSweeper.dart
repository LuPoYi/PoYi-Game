import 'package:flutter/material.dart';
import 'layout/appbar.dart';
import 'layout/drawer.dart';
import 'layout/floatingActionButton.dart';
import 'dart:math';

class MineSweeper extends StatefulWidget {
  _MineSweeperState createState() => _MineSweeperState();
}

class _MineSweeperState extends State<MineSweeper> {
  List<List<String>> board = [
    ["", "", "", "", ""],
    ["", "", "", "", ""],
    ["", "", "", "", ""],
    ["", "", "", "", ""],
    ["", "", "", "", ""],
  ];

  List<List<String>> coverBoard = [
    ["", "", "", "", ""],
    ["", "", "", "", ""],
    ["", "", "", "", ""],
    ["", "", "", "", ""],
    ["", "", "", "", ""],
  ];

  int randomSeed = 5;
  bool isGameOver = false;

  @override
  initState() {
    _resetBoard();
  }

  void _sweep(int x, int y) {
    if (!isGameOver) {
      _pick(x, y);
      print("c: " + coverBoard.toString());
      print("b: " + board.toString());
    }
  }

  void _pick(int x, int y) {
    setState(() {
      if (coverBoard[x][y].isEmpty) {
        coverBoard[x][y] = "S";
      }
      if (board[x][y] == "X") {
        isGameOver = true;
      }
    });
  }

  void _resetBoard() {
    setState(() {
      board = board
          .map((list) => list
              .map((item) => Random().nextInt(randomSeed) == 0 ? "X" : "O")
              .toList())
          .toList();

      coverBoard =
          coverBoard.map((list) => list.map((item) => "").toList()).toList();
    });

    isGameOver = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: buildAppBar(context, "Mine Sweeper"),
            drawer: buildDrawer(context),
            body: _buildBody(context),
            floatingActionButton:
                buildFloatingActionButton(context, _resetBoard)));
  }

  Widget _buildBody(BuildContext context) {
    return Column(children: <Widget>[
      Center(
        child: Container(
          child: Text('GOGOGOGOG'),
        ),
      ),
      Container(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_buildBoard()],
      )),
      if (isGameOver) Text("Game Over!"),
    ]);
  }

  Widget _buildBoard() {
    return Column(
        children: List.generate(
      5,
      (x) => Row(
        children: new List.generate(5, (y) => _buildBox(x, y)),
      ),
    ));
  }

  Widget _buildBox(int x, int y) {
    BoxBorder border = Border();
    BorderSide borderStyle = BorderSide(width: 1, color: Colors.black26);
    double height = 80;
    double width = 80;

    border = Border(
        top: borderStyle,
        bottom: borderStyle,
        left: borderStyle,
        right: borderStyle);

    return InkWell(
        onTap: () {
          _sweep(x, y);
        },
        child: (Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: border,
            ),
            height: height,
            width: width,
            child: Center(child: Text((() {
              if (coverBoard[x][y].toString() == '') {
                return '';
              }
              return board[x][y].toString();
            })())))));
  }
}

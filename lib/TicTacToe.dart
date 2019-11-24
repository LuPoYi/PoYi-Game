import 'package:flutter/material.dart';
import 'dart:math';
//import 'components/board.dart';

class TicTacToe extends StatefulWidget {
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<List<String>> board = [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""]
  ];
  bool isGameOver = false;
  String currentPlayer = "O";

  void _move(int x, int y) {
    if (!isGameOver) {
      _pick(x, y);
      _checkWinner(x, y);
      _changePlayer();
    }
  }

  void _pick(int x, int y) {
    if (board[x][y].isEmpty) {
      setState(() {
        board[x][y] = currentPlayer;
      });
    }
  }

  void _checkWinner(int x, int y) {
    var col = 0, row = 0, diag = 0, rdiag = 0;

    for (int i = 0; i < 3; i++) {
      if (board[x][i] == currentPlayer) col++;
      if (board[i][y] == currentPlayer) row++;
      if (board[i][i] == currentPlayer) diag++;
      if (board[i][2 - i] == currentPlayer) rdiag++;
    }

    if (row == 3 || col == 3 || diag == 3 || rdiag == 3) {
      setState(() {
        isGameOver = true;
      });
    }
  }

  void _resetBoard() {
    setState(() {
      board = [
        ["", "", ""],
        ["", "", ""],
        ["", "", ""]
      ];
      isGameOver = false;
      currentPlayer = "O";
    });
  }

  void _changePlayer() {
    if (currentPlayer == "X") {
      currentPlayer = "O";
    } else {
      currentPlayer = "X";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: _buildAppBar(context),
            drawer: _buildDrawer(context),
            body: _buildBody(context),
            floatingActionButton: FloatingActionButton(
              onPressed: _resetBoard,
              tooltip: '重玩',
              child: Icon(Icons.refresh),
            )));
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('PoYi Demo 3'),
      backgroundColor: Colors.black,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_alert),
        )
      ],
    );
  }

  Widget _buildDrawer(BuildContext context) {
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
            title: Text('Tic Tac Toe'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('WinMine'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
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
      if (isGameOver) Text("Game Over, ${currentPlayer} Win!"),
    ]);
  }

  Widget _buildBoard() {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        _buildBox(0, 0),
        _buildBox(0, 1),
        _buildBox(0, 2)
      ]),
      Row(children: <Widget>[
        _buildBox(1, 0),
        _buildBox(1, 1),
        _buildBox(1, 2)
      ]),
      Row(children: <Widget>[_buildBox(2, 0), _buildBox(2, 1), _buildBox(2, 2)])
    ]);
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
          _move(x, y);
        },
        child: (Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: border,
          ),
          height: height,
          width: width,
          child: Center(child: Text(board[x][y].toString())),
        )));
  }
}

Color getColor() {
  return Color.fromARGB(
      255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));
}

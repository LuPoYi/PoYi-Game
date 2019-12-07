import 'package:flutter/material.dart';
import 'layout/appbar.dart';
import 'layout/drawer.dart';
import 'layout/floatingActionButton.dart';

class Snake extends StatefulWidget {
  _SnakeState createState() => _SnakeState();
}

class _SnakeState extends State<Snake> {
  bool isGameOver = false;

  @override
  initState() {
    _resetBoard();
  }

  void _resetBoard() {
    setState(() {});

    isGameOver = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: buildAppBar(context, "Snake"),
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
        onTap: () {},
        child: (Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: border,
            ),
            height: height,
            width: width,
            child: Center(child: Text("Hi")))));
  }
}

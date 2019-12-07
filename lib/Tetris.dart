import 'package:flutter/material.dart';
import 'layout/appbar.dart';
import 'layout/drawer.dart';
import 'layout/floatingActionButton.dart';

/// 可堆疊的總行數
const ROWS = 20;

/// 一行最多擺放的寬度
const COLS = 10;

class Tetris extends StatefulWidget {
  _TetrisState createState() => _TetrisState();
}

class _TetrisState extends State<Tetris> {
  bool isGameOver = false;
  bool selected = false;

  Animation<double> animation;
  AnimationController controller;

  @override
  initState() {
    _resetBoard();
  }

  void _resetBoard() {
    setState(() {
      selected = !selected;
    });

    isGameOver = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: buildAppBar(context, "Tetris"),
            drawer: buildDrawer(context),
            floatingActionButton:
                buildFloatingActionButton(context, _resetBoard)));
  }
}

//class GamePainter extends CustomPainter {}

class TetrisPianter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    Paint paint = Paint()
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1
      ..shader = LinearGradient(
        colors: <Color>[
          Colors.green,
          Colors.green,
          Colors.green,
        ],
        stops: [
          0.0,
          0.5,
          1.0,
        ],
      ).createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) => true;
}

import 'package:flutter/material.dart';
import 'layout/appbar.dart';
import 'layout/drawer.dart';
import 'layout/floatingActionButton.dart';
import './services/firebase.dart';

class BullsCows extends StatefulWidget {
  BullsCows({Key key}) : super(key: key);

  @override
  _BullsCowsState createState() => _BullsCowsState();
}

class _BullsCowsState extends State<BullsCows> {
  final modeList = ['basic', 'bot', 'friend'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: buildAppBar(context, "Mine Sweeper"),
            drawer: buildDrawer(context),
            body: _buildBody(context),
            floatingActionButton: buildFloatingActionButton(context, null)));
  }

  Widget _buildBody(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text("2A1B"),
        _buildCurrentCard(context),
        _buildCardResult(context),
        _buildInputCard(context),
      ],
    ));
  }

  Widget _buildCurrentCard(BuildContext context) {
    return Text('_buildCurrentCard');
  }

  Widget _buildCardResult(BuildContext context) {
    return Text('_buildCardResult');
  }

  Widget _buildInputCard(BuildContext context) {
    return Text('_buildInputCard');
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'layout/appbar.dart';
import 'layout/drawer.dart';
import 'package:sensors/sensors.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Sensor extends StatefulWidget {
  _SensorState createState() => _SensorState();
}

class _SensorState extends State<Sensor> {
  bool isVolumeUp = true;
  int accelerometerX;
  int accelerometerY;
  int accelerometerZ;
  List<double> _userAccelerometerValues;
  List<double> _gyroscopeValues;
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];
  AudioCache player = AudioCache();

  @override
  void initState() {
    super.initState();

    Fluttertoast.showToast(
        msg: "Hi",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);

    //Accelerometer events
    _streamSubscriptions
        .add(accelerometerEvents.listen((AccelerometerEvent event) {
      if (event.x.toInt() != accelerometerX ||
          event.y.toInt() != accelerometerY ||
          event.z.toInt() != accelerometerZ) {
        setState(() {
          accelerometerX = event.x.toInt();
          accelerometerY = event.y.toInt();
          accelerometerZ = event.z.toInt();

          if (isVolumeUp) {
            if (accelerometerX != null && accelerometerX > 9) {
              player.play('line_a_66.mp3');
              Fluttertoast.showToast(
                  msg: "line_a_66.mp3",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }

            if (accelerometerY != null && accelerometerY > 9) {
              player.play('line_logo_sound_short.mp3');
              Fluttertoast.showToast(
                  msg: "line_logo_sound_short.mp3",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
            if (accelerometerZ != null && accelerometerZ > 9) {
              player.play('line_logo_sound.mp3');
              Fluttertoast.showToast(
                  msg: "line_logo_sound.mp3",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
          }
        });
      }
    }));

    //UserAccelerometer events
    _streamSubscriptions
        .add(userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        _userAccelerometerValues = <double>[event.x, event.y, event.z];
      });
    }));

    //UserAccelerometer events
    _streamSubscriptions.add(gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
      });
    }));
  }

  @override
  void dispose() {
    for (StreamSubscription<dynamic> sub in _streamSubscriptions) {
      sub.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> gyroscope =
        _gyroscopeValues?.map((double v) => v.toStringAsFixed(1))?.toList();
    final List<String> userAccelerometer = _userAccelerometerValues
        ?.map((double v) => v.toStringAsFixed(1))
        ?.toList();

    return Scaffold(
      appBar: buildAppBar(context, "Sensors Example"),
      drawer: buildDrawer(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Accelerometer "),
              Text(accelerometerX.toString()),
              Text(accelerometerY.toString()),
              Text(accelerometerZ.toString()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("UserAccelerometer "),
              Text(userAccelerometer != null ? userAccelerometer[0] : "X"),
              Text(userAccelerometer != null ? userAccelerometer[1] : "X"),
              Text(userAccelerometer != null ? userAccelerometer[2] : "X"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Gyroscope "),
              Text(gyroscope != null ? gyroscope[0] : "X"),
              Text(gyroscope != null ? gyroscope[1] : "X"),
              Text(gyroscope != null ? gyroscope[2] : "X"),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: isVolumeUp ? Icon(Icons.volume_up) : Icon(Icons.volume_off),
        onPressed: () {
          setState(() {
            isVolumeUp = !isVolumeUp;
          });
        },
      ),
    );
  }
}

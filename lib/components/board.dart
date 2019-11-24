// import 'package:flutter/material.dart';

// class Board extends StatefulWidget {
//   Board({Key key}) : super(key: key);

//   _BoardState createState() => _BoardState();
// }

// class _BoardState extends State<Board> {
//   Widget build(BuildContext context) {
//           return Container(
//             padding: EdgeInsets.all(30),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   blurRadius: 7.0,
//                   spreadRadius: 0.0,
//                   color: Color(0x1F000000),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               GestureDetector(
//                                           child: _buildBox(1, 1, ' '),
//                                         ),
//                                       ),

//             ),

//   }

// Widget _buildBox(int i, int j) {
//   BoxBorder border = Border();
//   BorderSide borderStyle = BorderSide(width: 1, color: Colors.black26);
//   double height = 80;
//   double width = 80;

//   border = Border(
//       top: borderStyle,
//       bottom: borderStyle,
//       left: borderStyle,
//       right: borderStyle);

//   return Container(
//     decoration: BoxDecoration(
//       color: Colors.white,
//       border: border,
//     ),
//     height: height,
//     width: width,
//     child: Center(child: Text("A")),
//   );
// }

import 'dart:math';

import 'package:flutter/material.dart';

class DragableWidgetScreen extends StatefulWidget {
  @override
  State<DragableWidgetScreen> createState() {
    return _DragableWidgetScreen();
  }
}

class _DragableWidgetScreen extends State<DragableWidgetScreen> {
  double left = 0.0, top = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Draggable Widget"),
      ),
      body: Stack(children: [
        Image.asset('assets/images/flutterimagejpg.jpg'),
        Positioned(
          left: left,
          top: top,
          child: GestureDetector(
            onPanUpdate: (details) {
              left = max(0, left + details.delta.dx);
              top = max(0, top + details.delta.dy);
              setState(() {});
            },
            onTap: () {},
            child: Container(
              height: 100,
              width: 100,
              child: const Text("Hello"),
              // decoration: BoxDecoration(
              //   color: Colors.red,
              //   borderRadius: BorderRadius.circular(50),
              // ),
            ),
          ),
        ),
      ]),
    );
  }
}

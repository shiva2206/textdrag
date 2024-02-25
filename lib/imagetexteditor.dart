import 'dart:math';

import 'package:flutter/material.dart';

class ImageTextEditor extends StatefulWidget {
  @override
  State<ImageTextEditor> createState() => _ImageTextEditorState();
}

class _ImageTextEditorState extends State<ImageTextEditor> {
  TextEditingController textController = TextEditingController();
  List<Text> texts = [];
  List<double> left = [], top = [];
  List<Map<String, dynamic>> meta = [];
  void selectText(int index) {
    // Update the selected text index
  }

  // Update text properties function
  void updateTextProperties(TextStyle newStyle) {
    // Update the style of the selected text
  }
  void addText() {
    String text = textController.text;
    textController.text = "";
    if (text.isNotEmpty) {
      setState(() {
        left.add(0.0);
        top.add(0.0);
        texts.add(
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        );
      });
    }
  }

  List<Widget> getWidgetList(List<Text> texts) {
    List<Widget> widgetList = [];
    for (int i = 0; i < texts.length; i++) {
      Text text = texts[i];
      widgetList.add(
        Positioned(
          left: left[i],
          top: top[i],
          child: GestureDetector(
            onPanUpdate: (details) {
              left[i] = max(0, left[i] + details.delta.dx);
              top[i] = max(0, top[i] + details.delta.dy);
              setState(() {});
            },
            onTap: () {},
            child: Container(
              height: 100,
              width: 100,
              child: text,
              // decoration: BoxDecoration(
              //   color: Colors.red,
              //   borderRadius: BorderRadius.circular(50),
              // ),
            ),
          ),
        ),
      );
    }
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Display the selected image
          Image.asset('images/flutterimagejpg.jpg', fit: BoxFit.cover),

          // Layout for text input and add button
          Positioned(
            // Position appropriately
            child: Column(
              children: [
                // Text input field
                TextFormField(
                  controller: textController,
                ),
                ElevatedButton(
                  onPressed: addText,
                  child: const Text('Add Text'),
                ),
              ],
            ),
          ),

          // Stack for movable text elements
          Stack(
            children: getWidgetList(texts),
          ),
        ],
      ),
    );
  }
}

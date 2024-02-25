import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:techtesser/imagetexteditor.dart';
import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:techtesser/fontselectionDemo.dart';

// import 'package:techtesser/fontselectionDemo.dart';

void main() {
  runApp(MyApp());
}

final Map<String, TextStyle> fontMap = {
  'Roboto': GoogleFonts.roboto(),
  'Lato': GoogleFonts.lato(),
  'Pacifico': GoogleFonts.pacifico(),
  'aDlamDisplay': GoogleFonts.aDLaMDisplay(),
  'Aboreto': GoogleFonts.aboreto(),
};
final Map<String, Color> colorMap = {
  // Add 25 key-value pairs for your desired colors:
  'lightBlueAccent': Colors.lightBlueAccent,
  'Amber': Colors.amber,
  'Black': Colors.black,
  'Blue': Colors.blue,
  'Brown': Colors.brown,
  'Cyan': Colors.cyan,
  'DeepOrange': Colors.deepOrange,
  'DeepPurple': Colors.deepPurple,
  'Green': Colors.green,
  'Grey': Colors.grey,
  'Indigo': Colors.indigo,
  'LightBlue': Colors.lightBlue,
  'Lime': Colors.lime,
  'Orange': Colors.orange,
  'Pink': Colors.pink,
  'Purple': Colors.purple,
  'Red': Colors.red,
  'Teal': Colors.teal,
  'Yellow': Colors.yellow,
  // ... add more colors as needed
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FontSelectionDemo(),
    );
  }
}

class FontSelectionDemo extends StatefulWidget {
  @override
  _FontSelectionDemoState createState() => _FontSelectionDemoState();
}

class _FontSelectionDemoState extends State<FontSelectionDemo> {
  // _FontSelectionDemoState(Text tt);

  TextStyle _selectedFontFamily = GoogleFonts.roboto();
  String _selectedColor = 'Black';
  double _selectedFontSize = 16.0;
  FontWeight _selectedFontWeight = FontWeight.normal;
  FontStyle _selectedFontStyle = FontStyle.normal;
  double left = 0.0, top = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sample Text',
          style: TextStyle(
            fontFamily:
                'Times New Roman', // Set the font family to Times New Roman
            fontSize: 20, // Set the font size (optional)
            fontWeight: FontWeight.normal, // Set the font weight (optional)
            fontStyle: FontStyle.normal,
            // Set the font style (optional)
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<String>(
                    value: _selectedColor,
                    items: colorMap.keys.map((colorName) {
                      return DropdownMenuItem<String>(
                        value: colorName,
                        child: Text(
                          colorName,
                          style: TextStyle(color: colorMap[colorName]),
                        ),
                      );
                    }).toList(),
                    onChanged: (newColor) {
                      setState(() {
                        _selectedColor = newColor!; // Update selected color
                      });
                    },
                  ),
                  DropdownButton<TextStyle>(
                    value: _selectedFontFamily,
                    items: fontMap.keys
                        .map(
                          (key) => DropdownMenuItem<TextStyle>(
                            value: fontMap[key],
                            child: Text(
                              key,
                              style: fontMap[key],
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedFontFamily = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Slider(
                    value: _selectedFontSize,
                    min: 10,
                    max: 100,
                    divisions: 30,
                    onChanged: (value) {
                      setState(() {
                        _selectedFontSize = value;
                      });
                    },
                  ),
                  Text('Font Size: ${_selectedFontSize.toStringAsFixed(1)}'),
                  const SizedBox(height: 10),
                  DropdownButton<FontWeight>(
                    value: _selectedFontWeight,
                    items: const [
                      DropdownMenuItem(
                        value: FontWeight.normal,
                        child: Text('Normal'),
                      ),
                      DropdownMenuItem(
                        value: FontWeight.bold,
                        child: Text('Bold'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedFontWeight = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<FontStyle>(
                    value: _selectedFontStyle,
                    items: const [
                      DropdownMenuItem(
                        value: FontStyle.normal,
                        child: Text('Normal'),
                      ),
                      DropdownMenuItem(
                        value: FontStyle.italic,
                        child: Text('Italic'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedFontStyle = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
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
                  child: Text(
                    'Your text here',
                    style: TextStyle(
                      fontFamily: _selectedFontFamily
                          .fontFamily, // Get font family from GoogleFonts
                      fontSize: _selectedFontSize, // Customize font size
                      fontWeight: _selectedFontWeight, // Set bold style
                      fontStyle: _selectedFontStyle, // Set italic style
                      color: colorMap[
                          _selectedColor], // Add additional color customization
                    ),
                  ),
                  // decoration: BoxDecoration(
                  //   color: Colors.red,
                  //   borderRadius: BorderRadius.circular(50),
                  // ),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

class ImageTextEditor extends StatefulWidget {
  const ImageTextEditor({Key? key}) : super(key: key);

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

          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: getWidgetList(texts),
              ),
            ],
          ),
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

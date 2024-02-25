import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontSelectionDemo extends StatefulWidget {
  @override
  _FontSelectionDemoState createState() => _FontSelectionDemoState();
}

class _FontSelectionDemoState extends State<FontSelectionDemo> {
  // _FontSelectionDemoState(Text tt);
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
  TextStyle _selectedFontFamily = GoogleFonts.roboto();
  String _selectedColor = 'Black';
  double _selectedFontSize = 16.0;
  FontWeight _selectedFontWeight = FontWeight.normal;
  FontStyle _selectedFontStyle = FontStyle.normal;

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              // items: [
              //   DropdownMenuItem(
              //     value: GoogleFonts.roboto(),
              //     child: Text(
              //       'Roboto',
              //       style: GoogleFonts.roboto(),
              //     ),
              //   ),
              //   DropdownMenuItem(
              //     value: GoogleFonts.arima(),
              //     child: Text('Arima'),
              //   ),
              //   DropdownMenuItem(
              //     value: GoogleFonts.amaranth(),
              //     child: Text('Amaranth'),
              //   ),
              // ],
              onChanged: (value) {
                setState(() {
                  _selectedFontFamily = value!;
                });
              },
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            Text(
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
          ],
        ),
      ),
    );
  }
}

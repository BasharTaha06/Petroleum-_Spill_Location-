import 'package:flutter/material.dart';
import 'connectionscreen.dart'; // Importing the ConnectionScreen to set it as the home screen

// Entry point of the Flutter application
void main() {
  runApp(MyApp()); // Calling the MyApp widget
}

// Main application widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner in the top-right corner
      home: ConnectionScreen(), // Sets ConnectionScreen as the starting screen
    );
  }
}

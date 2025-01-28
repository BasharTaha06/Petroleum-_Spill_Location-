  import 'package:flutter/material.dart';
  import 'connectionscreen.dart';

  void main() {
    runApp(MyApp());
  }

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ConnectionScreen(),
      );
    }
  }


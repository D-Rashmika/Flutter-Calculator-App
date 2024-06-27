import 'package:flutter/material.dart';
import 'calculator_screen.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
        ),
      ),
      home: CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

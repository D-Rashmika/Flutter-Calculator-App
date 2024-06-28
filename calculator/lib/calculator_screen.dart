import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _result = "0";
  String _operation = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      setState(() {
        _output = "0";
        _result = "0";
        _operation = "";
      });
    } else if (buttonText == "=") {
      try {
        Expression expression = Expression.parse(_output);
        final evaluator = const ExpressionEvaluator();
        var result = evaluator.eval(expression, {});
        setState(() {
          _result = result.toString();
          _output = _result;
        });
      } catch (e) {
        setState(() {
          _result = "Error";
          _output = _result;
        });
      }
    } else if (buttonText == "⌫") {
      setState(() {
        _output = _output.length > 1 ? _output.substring(0, _output.length - 1) : "0";
      });
    } else {
      setState(() {
        if (_output == "0") {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
      });
    }
  }

Widget buildButton(String buttonText, Color color, {Color textColor = Colors.black}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.all(24.0),
            textStyle: TextStyle(fontSize: 24.0),
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(buttonText, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }


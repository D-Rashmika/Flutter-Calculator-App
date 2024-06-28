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

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey.shade900,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildButton("AC", Colors.green, textColor: Colors.white),
                    buildButton("(", Colors.green, textColor: Colors.white),
                    buildButton(")", Colors.green, textColor: Colors.white),
                    buildButton("/", Colors.green, textColor: Colors.white),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("7", Colors.pink.shade200),
                    buildButton("8", Colors.pink.shade200),
                    buildButton("9", Colors.pink.shade200),
                    buildButton("*", Colors.green, textColor: Colors.white),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("4", Colors.pink.shade200),
                    buildButton("5", Colors.pink.shade200),
                    buildButton("6", Colors.pink.shade200),
                    buildButton("-", Colors.green, textColor: Colors.white),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("1", Colors.pink.shade200),
                    buildButton("2", Colors.pink.shade200),
                    buildButton("3", Colors.pink.shade200),
                    buildButton("+", Colors.green, textColor: Colors.white),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildButton("0", Colors.pink.shade200),
                    buildButton(".", Colors.pink.shade200),
                    buildButton("⌫", Colors.pink.shade200),
                    buildButton("=", Colors.green, textColor: Colors.white),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
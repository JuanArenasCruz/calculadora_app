import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _output = "0";
  String _tempOutput = "0";
  String _operator = "";
  double _num1 = 0;
  double _num2 = 0;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        _output = "0";
        _tempOutput = "0";
        _operator = "";
        _num1 = 0;
        _num2 = 0;
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "×" ||
          buttonText == "÷") {
        _num1 = double.parse(_output);
        _operator = buttonText;
        _tempOutput = "0";
      } else if (buttonText == "=") {
        _num2 = double.parse(_output);
        double result = 0;
        if (_operator == "+") {
          result = _num1 + _num2;
        } else if (_operator == "-") {
          result = _num1 - _num2;
        } else if (_operator == "×") {
          result = _num1 * _num2;
        } else if (_operator == "÷") {
          result = _num1 / _num2;
        }
        _output =
            result % 1 == 0 ? result.toInt().toString() : result.toString();
        _operator = "";
        _tempOutput = _output;
      } else if (buttonText == "+/-") {
        double currentValue = double.parse(_output);
        _output = (currentValue * -1).toString();
        _tempOutput = _output;
      } else if (buttonText == "%") {
        double currentValue = double.parse(_output);
        _output = (currentValue / 100).toString();
        _tempOutput = _output;
      } else {
        if (_tempOutput == "0") {
          _tempOutput = buttonText;
        } else {
          _tempOutput = _tempOutput + buttonText;
        }
        _output = double.parse(_tempOutput) % 1 == 0
            ? int.parse(_tempOutput).toString()
            : _tempOutput;
      }
    });
  }

  Widget buildButton(String buttonText, Color buttonColor, Color textColor) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: SizedBox(
        width: 80.0,
        height: 80.0,
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 28,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48, color: Colors.white),
            ),
          ),
          Divider(color: Colors.white),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton("AC", Colors.grey, Colors.black),
                  buildButton("+/-", Colors.grey, Colors.black),
                  buildButton("%", Colors.grey, Colors.black),
                  buildButton("÷", Colors.orange, Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton("7", Colors.grey.shade800, Colors.white),
                  buildButton("8", Colors.grey.shade800, Colors.white),
                  buildButton("9", Colors.grey.shade800, Colors.white),
                  buildButton("×", Colors.orange, Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton("4", Colors.grey.shade800, Colors.white),
                  buildButton("5", Colors.grey.shade800, Colors.white),
                  buildButton("6", Colors.grey.shade800, Colors.white),
                  buildButton("-", Colors.orange, Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton("1", Colors.grey.shade800, Colors.white),
                  buildButton("2", Colors.grey.shade800, Colors.white),
                  buildButton("3", Colors.grey.shade800, Colors.white),
                  buildButton("+", Colors.orange, Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton("0", Colors.grey.shade800, Colors.white),
                  buildButton(".", Colors.grey.shade800, Colors.white),
                  buildButton("=", Colors.orange, Colors.white),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

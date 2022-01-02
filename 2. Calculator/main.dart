import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: const Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String equation = '0';
  String result = '0';
  double eqSize = 50.0;
  double resSize = 30.0;

  buttonResponse(String buttonText) {
    setState(() {
      if (buttonText == 'Clear') {
        equation = '0';
        result = '0';
        eqSize = 50.0;
        resSize = 30.0;
      }
      else if (buttonText == '<X]') {
        equation = equation.substring(0,equation.length-1);
        if (equation == '') {
          equation = '0';
        }
        eqSize = 50.0;
        resSize = 30.0;
      }
      else if (buttonText == '=') {
        eqSize = 30.0;
        resSize = 50.0;
        Parser p = Parser();
        Expression exp = p.parse(equation);
        ContextModel cm = ContextModel();
        result = exp.evaluate(EvaluationType.REAL, cm).toString();
      }
      else {
        if (equation == '0') {
          equation = buttonText;
        }
        else {
          equation = equation + buttonText;
        }
        eqSize = 50.0;
        resSize = 30.0;
      }
    });
  }

  Widget buildButton(String buttonText, int buttonSize, Color buttonColor) {
    return TextButton(
      onPressed: () => buttonResponse(buttonText),
      child: Container(
        width: (MediaQuery.of(context).size.width-100)/4,
        height: MediaQuery.of(context).size.height*0.1*buttonSize,
        color: buttonColor,
        child: Center(
          child: Text (
            buttonText,
            style: const TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(17.0,10.0,17.0,10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              equation,
              style: TextStyle(
                fontSize: eqSize,
              ),
            ),
            Text(
              result,
              style: TextStyle(
                fontSize: resSize,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Divider(
              height: 50.0,
              color: Colors.grey,
              thickness: 2.0,
            ),
            Row(
              children: [
                buildButton('Clear', 1, Colors.blueAccent),
                buildButton('<X]', 1, Colors.blueAccent),
                buildButton('%', 1, Colors.lightBlueAccent),
                buildButton('/', 1, Colors.lightBlueAccent),
              ],
            ),
            Row(
              children: [
                buildButton('7', 1, Colors.redAccent),
                buildButton('8', 1, Colors.redAccent),
                buildButton('9', 1, Colors.redAccent),
                buildButton('*', 1, Colors.lightBlueAccent),
              ],
            ),
            Row(
              children: [
                buildButton('4', 1, Colors.redAccent),
                buildButton('5', 1, Colors.redAccent),
                buildButton('6', 1, Colors.redAccent),
                buildButton('-', 1, Colors.lightBlueAccent),
              ],
            ),
            Row(
              children: [
                buildButton('1', 1, Colors.redAccent),
                buildButton('2', 1, Colors.redAccent),
                buildButton('3', 1, Colors.redAccent),
                buildButton('+', 1, Colors.lightBlueAccent),
              ],
            ),
            Row(
              children: [
                buildButton('00', 1, Colors.redAccent),
                buildButton('0', 1, Colors.redAccent),
                buildButton('.', 1, Colors.lightBlueAccent),
                buildButton('=', 1, Colors.lightBlueAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

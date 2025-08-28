
import 'package:calculator/Operand.dart';
import 'package:calculator/Operator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: const CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String _output = "0";

  Operand firstOperand = Operand();
  Operand? secondOperand;
  late Operand currentOperand = firstOperand;
  Operator? operator;

  void update() {
    setState(() {
      _output = currentOperand.toString();
    });
  }

  void clear() {
    firstOperand = Operand();
    secondOperand = null;
    currentOperand = firstOperand;
    operator = null;
    update();
  }

  void equal() {
    firstOperand.operation(operator!, secondOperand!);
    secondOperand = null;
    operator = null;
    currentOperand = firstOperand;
    update();
  }

  void onDigitClick(int digit) {
    currentOperand.addDigit(digit);
    update();
  }

  void onOperatorClick(Operator operator) {
    if (this.operator != null) {
      equal();
    }
    this.operator = operator;
    secondOperand = Operand();
    currentOperand = secondOperand!;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(

          child: Column(
            children: [

              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    _output,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 56,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                )
              ),

              Expanded(
                flex: 5,
                  child: Column(
                    children: [
                      Row (
                        children: [
                          Button(text: "C", onPressed: () {
                            clear();
                          }, color: Color(0xFF626B7C)),
                          Button(text: "+/-", onPressed: () {
                            currentOperand.changeSign();
                            update();
                          }, color: Color(0xFF626B7C)),
                          Button(text: "%", onPressed: () {}, color: Color(0xFF626B7C)),
                          Button(text: "÷", onPressed: () {
                            onOperatorClick(Operator.divide);
                          }, color: Color(0xFFE28D21)),
                        ],
                      ),
                      Row (
                        children: [
                          Button(text: "7", onPressed: () {
                            onDigitClick(7);
                          }, color: Color(0xFF393E51)),
                          Button(text: "8", onPressed: () {
                            onDigitClick(8);
                          }, color: Color(0xFF393E51)),
                          Button(text: "9", onPressed: () {
                            onDigitClick(9);
                          }, color: Color(0xFF393E51)),
                          Button(text: "×", onPressed: () {
                            onOperatorClick(Operator.multiply);
                          }, color: Color(0xFFE28D21)),
                        ],
                      ),
                      Row (
                        children: [
                          Button(text: "4", onPressed: () {
                            onDigitClick(4);
                          }, color: Color(0xFF393E51)),
                          Button(text: "5", onPressed: () {
                            onDigitClick(5);
                          }, color: Color(0xFF393E51)),
                          Button(text: "6", onPressed: () {
                            onDigitClick(6);
                          }, color: Color(0xFF393E51)),
                          Button(text: "-", onPressed: () {
                            onOperatorClick(Operator.subtract);
                          }, color: Color(0xFFE28D21)),
                        ],
                      ),
                      Row (
                        children: [
                          Button(text: "1", onPressed: () {
                            onDigitClick(1);
                          }, color: Color(0xFF393E51)),
                          Button(text: "2", onPressed: () {
                            onDigitClick(2);
                          }, color: Color(0xFF393E51)),
                          Button(text: "3", onPressed: () {
                            onDigitClick(3);
                          }, color: Color(0xFF393E51)),
                          Button(text: "+", onPressed: () {
                            onOperatorClick(Operator.add);
                          }, color: Color(0xFFE28D21)),
                        ],
                      ),
                      Row (
                        children: [
                          Button(text: "0", onPressed: () {
                            onDigitClick(0);
                          }, color: Color(0xFF393E51), flex: 2,),
                          Button(text: ".", onPressed: () {
                            currentOperand.addComma();
                            update();
                          }, color: Color(0xFF393E51)),
                          Button(text: "=", onPressed: () {
                            equal();
                          }, color: Color(0xFFE28D21)),
                        ],
                      )
                    ],
                  )
              )
            ],
          )

      ),

    );
  }
}


class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double fontSize;
  final int flex;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.fontSize = 24,
    this.flex = 1

});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
        child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                backgroundColor: color,
              padding: EdgeInsets.symmetric(vertical: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18)
              )
            ),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize
                  )
                ),
            ),
        )
    );
  }
}


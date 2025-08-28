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
                          Button(text: "C", onPressed: () {}, color: Color(0xFF626B7C)),
                          Button(text: "+/-", onPressed: () {}, color: Color(0xFF626B7C)),
                          Button(text: "%", onPressed: () {}, color: Color(0xFF626B7C)),
                          Button(text: "÷", onPressed: () {}, color: Color(0xFFE28D21)),
                        ],
                      ),
                      Row (
                        children: [
                          Button(text: "7", onPressed: () {}, color: Color(0xFF393E51)),
                          Button(text: "8", onPressed: () {}, color: Color(0xFF393E51)),
                          Button(text: "9", onPressed: () {}, color: Color(0xFF393E51)),
                          Button(text: "×", onPressed: () {}, color: Color(0xFFE28D21)),
                        ],
                      ),
                      Row (
                        children: [
                          Button(text: "4", onPressed: () {}, color: Color(0xFF393E51)),
                          Button(text: "5", onPressed: () {}, color: Color(0xFF393E51)),
                          Button(text: "6", onPressed: () {}, color: Color(0xFF393E51)),
                          Button(text: "-", onPressed: () {}, color: Color(0xFFE28D21)),
                        ],
                      ),
                      Row (
                        children: [
                          Button(text: "1", onPressed: () {}, color: Color(0xFF393E51)),
                          Button(text: "2", onPressed: () {}, color: Color(0xFF393E51)),
                          Button(text: "3", onPressed: () {}, color: Color(0xFF393E51)),
                          Button(text: "+", onPressed: () {}, color: Color(0xFFE28D21)),
                        ],
                      ),
                      Row (
                        children: [
                          Button(text: "0", onPressed: () {}, color: Color(0xFF393E51), flex: 2,),
                          Button(text: ".", onPressed: () {}, color: Color(0xFF393E51)),
                          Button(text: "=", onPressed: () {}, color: Color(0xFFE28D21)),
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
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize
                  )
                ),
                style: ElevatedButton.styleFrom(
                backgroundColor: color,
              padding: EdgeInsets.symmetric(vertical: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18)
              )
            ),
            ),
        )
    );
  }
}


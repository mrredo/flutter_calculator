
import 'package:flutter/material.dart';

class CalculatorMain extends StatelessWidget {
  const CalculatorMain({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Izvēlies kalkulatoru...'),
      ),
      body: const  Column(
        children: [
          CalculatorMainFul(),
        ],
      ),
    );
  }
}

class CalculatorMainFul extends StatefulWidget {
  const CalculatorMainFul({super.key});

  @override
  State<CalculatorMainFul> createState() => CalculatorMainState();
}

class CalculatorMainState extends State<CalculatorMainFul> {
  CalculatorMainState();
  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_calculator/pages/components/calculator.dart';

class GarumsMain extends StatelessWidget {
  const GarumsMain({super.key});
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                title: const Text("Garuma kalkulators"),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CalculatorStateFul(values: const ["1", "2", "3", "4", "5"]),
          ],
        ),
      ),
    );
    
 }
 }
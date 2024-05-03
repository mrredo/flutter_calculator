import 'package:flutter/material.dart';
import 'package:flutter_calculator/pages/bmi.dart';
import 'package:flutter_calculator/pages/calculator.dart';
import 'package:flutter_calculator/pages/components/fake.dart';
import 'package:flutter_calculator/pages/garums.dart';
import 'package:flutter_calculator/pages/main.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Color.fromRGBO(255, 255, 255, 1)),
          titleTextStyle: TextStyle(
            fontSize:  30,
            color: Color.fromRGBO(255, 255, 255, 1)
          ),
          backgroundColor:  Color.fromRGBO(126, 120, 210, 1)
        ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                //side: BorderSide(color: Colors.red)
                )
                ),
        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
        backgroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(126, 120, 210, 1)),
      ))),
      routes: {
        "/": (context) => const MainPage(),
        "/kalkulators": (context) => const CalculatorMain(),
        "/kalkulators/bmi": (context) => const BMIMainPage(),
        "/kalkulators/garums": (context) => const GarumsMain(),
      },
      initialRoute: "/",
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_calculator/pages/main.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const MainPage(),
      },
      initialRoute: "/",
    
    );
  }
}

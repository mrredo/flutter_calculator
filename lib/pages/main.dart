import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Kalkulators', style: TextStyle(fontSize: 50),),
            ],
          ),
        ), //Center
      ],),
    );
  }
}

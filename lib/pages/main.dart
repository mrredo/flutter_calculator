import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Center(
          child: Container(
            color: const Color.fromRGBO(126, 120, 210, 1),
            child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Kalkulators', style: TextStyle(fontSize: 50, color: Color.fromRGBO(255, 255, 255, 1)),),
            ],
          ),
          ),
        ), 
        Image.asset('assets/main_page_image.svg'),
      ],),
    );
  }
}

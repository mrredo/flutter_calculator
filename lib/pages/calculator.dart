
import 'package:flutter/material.dart';
import 'package:flutter_calculator/themes/textColor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalculatorMain extends StatelessWidget {
  const CalculatorMain({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Izvēlies kalkulatoru...'),
      ),
      body: Column(
        children: [
          CalculatorMainFul(name: "BMI kalkulators", path: "/kalkulators/bmi", imageURL: "/assets/google.svg",),
        ],
      ),
    );
  }
}

class CalculatorMainFul extends StatefulWidget {

  CalculatorMainFul({super.key, required this.name, required this.path, required this.imageURL});
  String imageURL;
  String path;

  String name;
  @override
  State<CalculatorMainFul> createState() => CalculatorMainState(name: name,path: path, imageURL: imageURL);
}

class CalculatorMainState extends State<CalculatorMainFul> {
  CalculatorMainState({required this.name, required this.path,required this.imageURL});
  String imageURL;
  String name;
  String path;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(

        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(126, 120, 210, 1)),
        ),
        onPressed: () {
          Navigator.pushNamed(context, path);
        },
        child: Row(children: [
          Container(
            padding: const EdgeInsets.only(left: 3, right: 3),
            child: SvgPicture.asset('assets/main_page_image.svg', width: 50, height: 50,),
          ),
          Text(name,
              textScaler: const TextScaler.linear(2),
              style: defaultElevatedButtonTextStyle()),
              
        ])
        ),
    );

  }
}

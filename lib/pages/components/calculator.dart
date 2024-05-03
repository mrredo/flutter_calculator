import 'package:flutter/material.dart';
import 'package:flutter_calculator/pages/components/fake.dart';
import 'package:flutter_calculator/themes/textColor.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CalculatorStateFul extends StatefulWidget {
  CalculatorStateFul({super.key, required this.values1, required this.values2});
  List<String> values1;
  List<String> values2;


  @override
  State<CalculatorStateFul> createState() => CalculatorStateFulState();
}
class CalculatorStateFulState extends State<CalculatorStateFul> {
  CalculatorStateFulState();

  @override
  Widget build(BuildContext context) {
    String dropdownValue = "";
    return Column(
      children: [
        SizedBox( 
          width: 80,
          height: 50,
          child: DropdownWidget(values: widget.values, value: dropdownValue),
        )
      ],
    );
  }
}
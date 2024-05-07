// import 'package:flutter/material.dart';
// import 'package:flutter_calculator/pages/components/fake.dart';
// import 'package:flutter_calculator/themes/textColor.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class Value {
//   Value({required this.Calculate, required this.from});
//   List<String> to;

//   List<String> from;
//   double Function() Calculate;
// }

// class CalculatorStateFul extends StatefulWidget {
//   CalculatorStateFul(
//       {super.key, required this.valuesFrom, required this.valuesTo});
//   List<String> valuesFrom;
//   List<String> valuesTo;

//   @override
//   State<CalculatorStateFul> createState() => CalculatorStateFulState();
// }

// class CalculatorStateFulState extends State<CalculatorStateFul> {
//   CalculatorStateFulState();

//   @override
//   Widget build(BuildContext context) {
//     String dropdownValue = "";
//     return Column(
//       children: [
//         SizedBox(
//           width: 80,
//           height: 50,
//           child: DropdownWidget(values: widget.values, value: dropdownValue),
//         )
//       ],
//     );
//   }
// }

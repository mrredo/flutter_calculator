import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_calculator/pages/components/conversion.dart';
import 'package:flutter_calculator/pages/components/fake.dart';
import 'package:flutter_calculator/pages/components/input.dart';
import 'package:flutter_calculator/pages/functions/notation.dart';
import 'package:flutter_calculator/themes/textColor.dart';

// import 'package:flutter_calculator/pages/components/calculator.dart';

Map<String, Conversion> platiba = {
  "m²": Conversion(
    conversionTo: (m) => pow(m, 2)*1, 
    conversionFrom: (a) => a),
  "cm²": Conversion(
      conversionTo: (m) => m * pow(0.01, 2),
      conversionFrom: (a) => a / pow(0.01, 2)),
  "dm²": Conversion(
       conversionTo: (m) => m * pow(0.1, 2), 
       conversionFrom: (a) => a / pow(0.1, 2)),
  "mm²": Conversion(
      conversionTo: (m) => m * pow(0.001, 2),
      conversionFrom: (a) => a / pow(0.001, 2)),
  "pēdas²": Conversion(
      conversionTo: (m) => m * pow(0.3048, 2),
      conversionFrom: (a) => a / pow(0.3048, 2)),
  "jardi²": Conversion(
      conversionTo: (m) => m * pow(0.9144, 2),
      conversionFrom: (a) => a / pow(0.9144, 2)),
  "sprīži²": Conversion(
      conversionTo: (m) => m * pow(0.0254, 2),
      conversionFrom: (a) => a / pow(0.0254, 2)),
};
// double km = 1;//km to cm
// Conversion kmf = garumi['km']!;
// Conversion cmf = garumi['cm']!;

// print(cmf.conversionFrom(kmf.conversionTo(km)));
List<String> names = Names(platiba);

class PlatibaMain extends StatelessWidget {
  const PlatibaMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Platības kalkulators"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PlatibaStateful(),
          ],
        ),
      ),
    );
  }
}

class PlatibaStateful extends StatefulWidget {
  const PlatibaStateful({super.key});

  @override
  State<PlatibaStateful> createState() => PlatibaStatefulState();
}

class PlatibaStatefulState extends State<PlatibaStateful> {
  PlatibaStatefulState();
  late String from;
  late String to;

  late DropdownWidget fromDropdown;
  late DropdownWidget toDropdown;
  late TextEditingController fromCon;
  late TextEditingController toCon;

  @override
  void initState() {
    from = "";
    to = "";
    fromCon = TextEditingController();
    fromCon.text = "1";
    toCon = TextEditingController();
    toCon.text = "1";

    fromDropdown = DropdownWidget(
      values: names,
      value: from,
      onChanged: (str) => handleClick(),
    );
    toDropdown = DropdownWidget(
      values: names,
      value: to,
      onChanged: (str) => handleClick(),
    );
    super.initState();
  }

  double convert(double val) {
    Conversion conv1 = platiba[fromDropdown.getSelectedValue()]!;
    Conversion conv2 = platiba[toDropdown.getSelectedValue()]!;
    double conTo1 = conv1.conversionTo(1);
    double conTo2 = conv1.conversionTo(1);
    if (conTo1 < conTo2) {
      return conv1.conversionFrom(conv2.conversionTo(val));
    } else {
      return conv2.conversionFrom(conv1.conversionTo(val));
    }
  }

  void handleClick() {
    if (fromCon.text == "") {
      toCon.text = "";
      return;
    }
    double converted = (convert(double.parse(fromCon.text)) * 100000000000).round() / 100000000000;
    toCon.text = formatLargeNumbers(converted);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "No: ",
                    style: TextStyle(
                      fontSize: 16, // Adjust the font size as needed
                      fontWeight: FontWeight.bold, // Apply bold font weight
                      color: Colors.blue, // Apply custom text color
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    height: 65,
                    child: fromDropdown,
                  ),
                  SizedBox(
                    width: 300,
                    height: 80,
                    child: InputWidget(
                      onChanged: (str) {
                        fromCon.text = str;
                        fromCon.selection = TextSelection.fromPosition(
                          TextPosition(offset: fromCon.text.length),
                        );
                        handleClick();
                      },
                      value: fromCon,
                      hintText: "",
                      labelText: "",
                    ),
                  )
                ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Uz: ",
                    style: TextStyle(
                      fontSize: 16, // Adjust the font size as needed
                      fontWeight: FontWeight.bold, // Apply bold font weight
                      color: Colors.blue, // Apply custom text color
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    height: 65,
                    child: toDropdown,
                  ),
                  SizedBox(
                    width: 300,
                    height: 100,
                    child: InputWidget(
                      value: toCon,
                      disabled: true,
                      hintText: "",
                      labelText: "",
                    ),
                  )
                ]),
          ],
        ),
      ],
    );
  }
}

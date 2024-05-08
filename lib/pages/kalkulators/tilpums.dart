import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_calculator/pages/components/conversion.dart';
import 'package:flutter_calculator/pages/components/fake.dart';
import 'package:flutter_calculator/pages/components/input.dart';
import 'package:flutter_calculator/pages/functions/notation.dart';
import 'package:flutter_calculator/themes/textColor.dart';


Map<String, Conversion> tilpums = {
  "m³": Conversion(
    conversionTo: (m) => pow(m, 3)*1, 
    conversionFrom: (a) => a),
  "cm³": Conversion(
      conversionTo: (m) => m * pow(0.01, 3),
      conversionFrom: (a) => a / pow(0.01, 3)),
  "dm³": Conversion(
       conversionTo: (m) => m * pow(0.1, 3), 
       conversionFrom: (a) => a / pow(0.1, 3)),
  "mm³": Conversion(
      conversionTo: (m) => m * pow(0.001, 3),
      conversionFrom: (a) => a / pow(0.001, 3)),
  "pēdas³": Conversion(
      conversionTo: (m) => m * pow(0.3048, 3),
      conversionFrom: (a) => a / pow(0.3048, 3)),
  "jardi³": Conversion(
      conversionTo: (m) => m * pow(0.9144, 3),
      conversionFrom: (a) => a / pow(0.9144, 3)),
  "sprīži³": Conversion(
      conversionTo: (m) => m * pow(0.0254, 3),
      conversionFrom: (a) => a / pow(0.0254, 3)),
};
// double km = 1;//km to cm
// Conversion kmf = garumi['km']!;
// Conversion cmf = garumi['cm']!;

// print(cmf.conversionFrom(kmf.conversionTo(km)));
List<String> names = Names(tilpums);

class TilpumsMain extends StatelessWidget {
  const TilpumsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tilpuma kalkulators"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TilpumsStateful(),
          ],
        ),
      ),
    );
  }
}

class TilpumsStateful extends StatefulWidget {
  const TilpumsStateful({super.key});

  @override
  State<TilpumsStateful> createState() => TilpumsStatefulState();
}

class TilpumsStatefulState extends State<TilpumsStateful> {
  TilpumsStatefulState();
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

    fromDropdown = DropdownWidget(values: names, value: from, onChanged: (str) => handleClick(),);
    toDropdown = DropdownWidget(values: names, value: to, onChanged: (str) => handleClick(),);
    super.initState();
  }

  double convert(double val) {
    Conversion conv1 = tilpums[fromDropdown.getSelectedValue()]!;
    Conversion conv2 = tilpums[toDropdown.getSelectedValue()]!;
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

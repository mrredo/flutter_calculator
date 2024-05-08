import 'package:flutter/material.dart';
import 'package:flutter_calculator/pages/components/conversion.dart';
import 'package:flutter_calculator/pages/components/fake.dart';
import 'package:flutter_calculator/pages/components/input.dart';
import 'package:flutter_calculator/themes/textColor.dart';

// import 'package:flutter_calculator/pages/components/calculator.dart';
class Garumi {
  Garumi({required this.meterConversion, required this.name});
  String name;
  double Function(double m) meterConversion;
}

Map<String, Conversion> garumi = {
  "km": Conversion(
      name: "km",
      conversionTo: (m) => m * 1000,
      conversionFrom: (a) => a / 1000),
  "m": Conversion(name: "m", conversionTo: (m) => m, conversionFrom: (a) => a),
  "cm": Conversion(
      name: "cm",
      conversionTo: (m) => m * 0.01,
      conversionFrom: (a) => a / 0.01),
  "dm": Conversion(
      name: "dm", conversionTo: (m) => m * 0.1, conversionFrom: (a) => a / 0.1),
  "mm": Conversion(
      name: "mm",
      conversionTo: (m) => m * 0.001,
      conversionFrom: (a) => a / 0.001),
  "jūdzes": Conversion(
      name: "jūdzes",
      conversionTo: (m) => m * 1609.344,
      conversionFrom: (a) => a / 1609.344),
  "pēdas": Conversion(
      name: "pēdas",
      conversionTo: (m) => m * 0.3048,
      conversionFrom: (a) => a / 0.3048),
  "jardi": Conversion(
      name: "jardi",
      conversionTo: (m) => m * 0.9144,
      conversionFrom: (a) => a / 0.9144),
  "sprīži": Conversion(
      name: "sprīži",
      conversionTo: (m) => m * 0.0254,
      conversionFrom: (a) => a / 0.0254),
};
// double km = 1;//km to cm
// Conversion kmf = garumi['km']!;
// Conversion cmf = garumi['cm']!;

// print(cmf.conversionFrom(kmf.conversionTo(km)));
List<String> names = Names(garumi);

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
            GarumsStateful(),
          ],
        ),
      ),
    );
  }
}

class GarumsStateful extends StatefulWidget {
  const GarumsStateful({super.key});

  @override
  State<GarumsStateful> createState() => GarumsStatefulState();
}

class GarumsStatefulState extends State<GarumsStateful> {
  GarumsStatefulState();
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
    Conversion conv1 = garumi[fromDropdown.getSelectedValue()]!;
    Conversion conv2 = garumi[toDropdown.getSelectedValue()]!;
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
    toCon.text = ((convert(double.parse(fromCon.text)) * 100000000000).round() /
            100000000000)
        .toString();
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
                    width: 200,
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
                    width: 200,
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
        ElevatedButton(
            onPressed: handleClick,
            child: Text("Aprēķināt", style: defaultElevatedButtonTextStyle()))
      ],
    );
  }
}

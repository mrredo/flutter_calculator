
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calculator/themes/textColor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BMIMainPage extends StatelessWidget {
  const BMIMainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI kalkulators'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BmiMainFul(),
          ],
        ),
      ),
    );
  }
}

class BmiMainFul extends StatefulWidget {

  BmiMainFul({super.key});

  @override
  State<BmiMainFul> createState() => BmiMainFulState();
}

class BmiMainFulState extends State<BmiMainFul> {
  BmiMainFulState();
  TextEditingController garums = TextEditingController();
  TextEditingController svars = TextEditingController();

  void calculateBMi() {
    double kg = double.parse(svars.value.text);
    double cm = double.parse(garums.value.text);
    double m = cm/100;

    double bmi = kg/(m*m);
    bmi = (bmi*10).roundToDouble()/10;
    String rating = "";
    if(bmi <=25 && bmi >= 18.5) {
      rating = "Veselīgs svars";
    } else if(bmi < 18.5) {
      rating = "Par maz svars";
    } else if(bmi> 25) {
      rating = "Par daudz svars";

    }
    showModalBottomSheet(context: context, builder: (BuildContext context) {
      return  Container(
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          children: [
            Text("Tavs bmi: $bmi", textScaler: const TextScaler.linear(1.5)),
            Text("Svara vērtējums: $rating", textScaler: const TextScaler.linear(1.5)),
          ],
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        SizedBox(
          width: 300,
          child: TextFormField(
              style: const TextStyle(
                fontSize: 20,
              ),
                  controller: garums,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                      labelText: "tavs garums(cm)...",
                      hintText: "garums(cm)",
                      icon: Icon(Icons.calculate)
                  )
              ),
            ),
        SizedBox(
          width: 300,
          child: TextFormField(
            style: const TextStyle(
              fontSize: 20,
            ),
              controller: svars,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: const InputDecoration(
                  labelText: "tavs svars(kg)...",
                  hintText: "svars(kg)",
                  icon: Icon(Icons.calculate)
              )
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
            style: ButtonStyle(
            backgroundColor:
                    MaterialStateProperty.all(const Color.fromRGBO(126, 120, 210, 1)),
            ),
            onPressed: calculateBMi,
            child:
                    Text("Aprēķināt",
                            textScaler: const TextScaler.linear(1),
                            style: defaultElevatedButtonTextStyle()),

    ),

      ],
    );

  }
}

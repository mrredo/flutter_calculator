
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatefulWidget {
  InputWidget(
      {Key? key,
      required this.value,
      required this.hintText,
      required this.labelText,
      this.disabled
      })
      : super(key: key);
  String hintText;
  String labelText;
  bool? disabled;
  late TextEditingController value;

  @override
  State<InputWidget> createState() => _InputButtonExampleState();

  String getSelectedValue() {
    return value.value.text;
  }
}

class _InputButtonExampleState extends State<InputWidget> {
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.disabled != null? !widget.disabled! : true,
        style: const TextStyle(
          fontSize: 20,
        ),
        controller: widget.value,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            icon: const Icon(Icons.calculate)));
  }
}

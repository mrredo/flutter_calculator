import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  DropdownWidget(
      {Key? key, required this.values, required this.value, this.onChanged})
      : super(key: key);

  final List<String> values;
  late String value;
  void Function(String?)? onChanged;

  @override
  State<DropdownWidget> createState() => _DropdownButtonExampleState();

  String getSelectedValue() {
    return value;
  }
}

class _DropdownButtonExampleState extends State<DropdownWidget> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.values.first; // Initialize in initState
    widget.value = dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          widget.value = value;
        });
        if (widget.onChanged != null) widget.onChanged!(value);
      },
      items: widget.values.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

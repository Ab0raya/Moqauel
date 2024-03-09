import 'package:flutter/material.dart';


class Tagarob extends StatelessWidget {
  const Tagarob({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: const Center(
        child: RadioGroup(),
      ),
    );
  }
}

class RadioGroup extends StatefulWidget {
  const RadioGroup({super.key});

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  int? _selectedRadio = 0;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedRadio = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
          value: 0,
          groupValue: _selectedRadio,
          onChanged: _handleRadioValueChange,
        ),
        const Text(
          'Option 1',
          style: TextStyle(fontSize: 16),
        ),
        const Spacer(),
        Radio(
          value: 1,
          groupValue: _selectedRadio,
          onChanged: _handleRadioValueChange,
        ),
        const Text(
          'Option 2',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

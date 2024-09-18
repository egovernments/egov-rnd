
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/bloc/digit_checkbox_tile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DigitCheckboxTileTestScreen extends StatefulWidget {
  @override
  _DigitCheckboxTileTestScreenState createState() => _DigitCheckboxTileTestScreenState();
}

class _DigitCheckboxTileTestScreenState extends State<DigitCheckboxTileTestScreen> {
  bool _isChecked = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DigitCheckbox Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocProvider(
              create: (context) => DigitCheckboxTileBloc(),
              child: DigitCheckboxTile(
                enableVoice: true,
                label: 'Check me!',
                value: _isChecked,
                onChanged: _toggleCheckbox,
                padding: const EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Checkbox is ${_isChecked ? "checked" : "unchecked"}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UnitConverterScreen(),
    );
  }
}

class UnitConverterScreen extends StatefulWidget {
  @override
  _UnitConverterScreenState createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  String _selectedUnit = 'Centimeters to Meters';
  String _result = '';

  final Map<String, double> _conversionRates = {
    'Centimeters to Meters': 0.01,
    'Meters to Centimeters': 100.0,
    'Grams to Kilograms': 0.001,
    'Kilograms to Grams': 1000.0,
  };

  void _convert() {
    double inputValue = double.tryParse(_controller.text) ?? 0;
    double conversionRate = _conversionRates[_selectedUnit]!;
    double convertedValue = inputValue * conversionRate;

    setState(() {
      _result = 'Result: $convertedValue';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input Value TextField
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Value',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Dropdown for Unit Selection
            DropdownButton<String>(
              value: _selectedUnit,
              isExpanded: true,
              items: _conversionRates.keys.map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedUnit = newValue!;
                });
              },
            ),
            SizedBox(height: 16),

            // Convert Button
            ElevatedButton(
              onPressed: _convert,
              child: Text('Convert'),
            ),
            SizedBox(height: 16),

            // Result Text
            Text(
              _result,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
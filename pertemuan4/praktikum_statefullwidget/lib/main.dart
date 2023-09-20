import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konverter Suhu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konversi Suhu'),
      ),
      body: Container(
        margin: const EdgeInsets.all(3),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: TemperatureConverter(),
          ),
        ),
      ),
    );
  }
}

// Temperatur Converter
class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final TextEditingController _inputController = TextEditingController();
  String _selectedOutputUnit = 'Fahrenheit';
  final list = [];

  final Map<String, double> _unitValues = {
    'Reamur': 0.0,
    'Fahrenheit': 0.0,
    'Kelvin': 0.0,
  };

  void _convert() {
    double inputValue = double.tryParse(_inputController.text) ?? 0.0;
    double outputValue;

    if (_selectedOutputUnit == 'Fahrenheit') {
      outputValue = (inputValue * 9 / 5) + 32;
    } else if (_selectedOutputUnit == 'Kelvin') {
      outputValue = inputValue + 273.15;
    } else if (_selectedOutputUnit == 'Reamur') {
      outputValue = inputValue * 4 / 5;
    } else {
      outputValue = 0;
    }

    // list.add(outputValue + " " + _selectedOutputUnit);
    list.add('$outputValue $_selectedOutputUnit');

    setState(() {
      _unitValues[_selectedOutputUnit] = outputValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _inputController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Masukkan suhu',
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DropdownButton<String>(
              value: _selectedOutputUnit,
              onChanged: (newValue) {
                setState(() {
                  _selectedOutputUnit = newValue!;
                });
              },
              items: _unitValues.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
        const SizedBox(height: 18.0),
        const Text(
          'Hasil',
          style: TextStyle(fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 2.0),
        Text(
          '${_unitValues[_selectedOutputUnit]?.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 18.0),
        ElevatedButton(
          onPressed: _convert,
          style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 45)),
          child: const Text(
            'Konversi',
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        const SizedBox(height: 20.0),
        const Text('Riwayat Konversi', style: TextStyle(fontSize: 18.0)),
        const SizedBox(height: 10.0),
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            reverse: true   ,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(list[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

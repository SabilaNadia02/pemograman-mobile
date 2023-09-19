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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Konversi Suhu'),
        ),
        body: Container(
            margin: EdgeInsets.all(3),
            child: Center(
                child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  MyForm(),
                  MyDropDownButton(),
                ],
              ),
            ))));
  }
}

//Drop Down Button
class MyDropDownButton extends StatefulWidget {
  @override
  _MyDropDownButtonState createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  String _selectedItem = 'Kelvin';

  void _onDropDownChanged(selectedItem) {
    setState(() {
      _selectedItem = selectedItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          value: _selectedItem,
          onChanged: _onDropDownChanged,
          items: <String>['Kelvin', 'Reamur'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// Form Suhu Input
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Masukkan Suhu',
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}

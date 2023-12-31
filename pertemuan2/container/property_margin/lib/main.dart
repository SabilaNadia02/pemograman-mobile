import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Contoh Margin")),
          body: Container(
              margin: EdgeInsets.all(50),
              height: 200,
              width: 200,
              alignment: Alignment.topLeft,
              color: Colors.blueGrey,
              child: Text(
                "Semangat Belajar Flutter",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ))),
    );
  }
}

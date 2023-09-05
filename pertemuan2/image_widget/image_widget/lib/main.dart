// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Image(
      image: NetworkImage(
          'https://img.okezone.com/content/2023/01/14/205/2746303/lagu-hot-seventeen-jadi-mv-tercepat-capai-100-juta-views-mCVqO9t3vQ.jpg'),
    ));
  }
}

import 'package:flutter/material.dart';

import 'year_month_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Year Month',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const YearMonthPicker(),
    );
  }
}

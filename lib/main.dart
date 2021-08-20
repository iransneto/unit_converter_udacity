import 'package:flutter/material.dart';
import 'category.route.dart';

final _appColor = Colors.green[100];

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[100],
        body: CategoryRoute('Unit Converter', color: _appColor),
      ),
    );
  }
}

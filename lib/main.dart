import 'package:flutter/material.dart';
import 'package:tonband/style.dart';
import 'package:tonband/ui/ScreenHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tonband',
      theme: ThemeData(
        primaryColor: colorPrimary,
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: colorTextPrimary, fontFamily: "Now"),
      ),
      home: ScreenHome(),
    );
  }
}

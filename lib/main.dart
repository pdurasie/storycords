import 'package:flutter/material.dart';
import 'package:storycords/style.dart';
import 'package:storycords/ui/components/WelcomeHeader.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Storycords',
      theme: ThemeData(
        primaryColor: colorPrimary,
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: colorTextPrimary, fontFamily: "Now"),
      ),
      home: Scaffold(
        body: WelcomeHeaderWidget(),
      ),
    );
  }
}

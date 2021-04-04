import 'package:flutter/material.dart';
import 'package:storycords/style.dart';

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
        body: HeaderWidget(),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget() : super();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      width: size.width,
      color: colorPrimary,
      child: Stack(
        children: [
          Positioned(
            bottom: size.height * 0.05,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: paddingLarge),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "WILLKOMMEN ZURÜCK,",
                    style: Theme.of(context).textTheme.bodyText1),
                TextSpan(text: "\n"),
                TextSpan(
                    text: "Patrick",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w600)),
              ])),
            ),
          ),
        ],
      ),
    );
  }
}

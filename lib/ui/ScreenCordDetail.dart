import 'package:flutter/material.dart';
import 'package:storycords/models/Cord.dart';

class ScreenCordDetail extends StatelessWidget {
  final Cord _cord;

  const ScreenCordDetail(this._cord) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(_cord.title),
        ],
      ),
    );
  }
}

/*
Beschreibung
Labels
Knöpfe sehen
Ausklappen für mehr Details
Ähnliche Cords
 */

/*
OP verlost einen Button an die beste Geschichte
 */

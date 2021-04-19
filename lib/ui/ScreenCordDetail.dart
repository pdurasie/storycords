import 'package:flutter/material.dart';
import 'package:storycords/models/Cord.dart';
import 'package:storycords/ui/components/CordRatingBox.dart';

class ScreenCordDetail extends StatelessWidget {
  final Cord _cord;

  const ScreenCordDetail(this._cord) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    _cord.title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                CordRatingBox(cord: _cord),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(_cord.description),
            ),
          ],
        ),
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

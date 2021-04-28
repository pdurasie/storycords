import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardWidgetWithShadow extends StatelessWidget {
  final child;

  CardWidgetWithShadow({required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      child: child,
    );
  }
}

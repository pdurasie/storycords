import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../style.dart';

class CardWidgetWithShadowAndInkwell extends StatelessWidget {
  final child;
  final onTap;
  CardWidgetWithShadowAndInkwell({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: InkWell(
        splashColor: colorPrimary,
        onTap: onTap,
        child: child,
      ),
    );
  }
}

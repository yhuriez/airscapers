import 'dart:ui';
import 'package:airscaper/common/colors.dart';
import 'package:airscaper/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ARSShadowBox extends StatelessWidget {
  final Color color;
  final Widget child;
  final double spreadRadius;
  final double blurRadius;
  final double radius;

  const ARSShadowBox(
      {Key key, this.child, this.color, this.spreadRadius, this.blurRadius, this.radius = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            const BoxShadow(
              color: Colors.white,
            ),
            BoxShadow(
              color: Colors.white,
              spreadRadius: spreadRadius,
              blurRadius: blurRadius,
            ),
          ],
        ),
        child: child);
  }

  factory ARSShadowBox.whiteBox(Widget child) => ARSShadowBox(
        child: child,
        color: Colors.white,
        spreadRadius: 20.0,
        blurRadius: 12.0,
      );

  factory ARSShadowBox.darkBox({@required Widget child, Color color}) => ARSShadowBox(
    child: child,
    color: color ?? containerColor,
    spreadRadius: 6.0,
    blurRadius: 12.0,
    radius: defaultRadius
  );
}


import 'package:flutter/material.dart';

class ARSShadowBox extends StatelessWidget {

  final Widget child;

  const ARSShadowBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            const BoxShadow(
              color: Colors.white,
            ),
            const BoxShadow(
              color: Colors.white,
              spreadRadius: 20.0,
              blurRadius: 12.0,
            ),
          ],
        ),
        child: child);
  }
}



import 'package:flutter/material.dart';

import 'ars_white_shadow.dart';

class ARSDialogBase extends StatelessWidget {

  final Widget child;

  const ARSDialogBase({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: ARSWhiteShadow(
          child: Material(
            color: Colors.transparent,
            child: child,
          ),
        ),
      ),
    );
  }

}
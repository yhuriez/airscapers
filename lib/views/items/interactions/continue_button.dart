


import 'package:airscaper/views/common/ars_button.dart';
import 'package:flutter/material.dart';

class ItemContinueButton extends StatelessWidget {

  final Function(BuildContext) onResolved;

  const ItemContinueButton(this.onResolved, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ARSButton(
      onClick: onResolved,
      text: Text(
        "Continuer",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    );
  }
}
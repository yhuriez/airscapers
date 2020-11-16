


import 'package:airscaper/common/entities/scenario_item.dart';
import 'package:airscaper/app/views/common/ars_button.dart';
import 'package:flutter/material.dart';

class ItemContinueButton extends StatelessWidget {

  final ScenarioItem item;
  final Function(BuildContext, ScenarioItem) onResolved;

  const ItemContinueButton(this.item, this.onResolved, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ARSButton(
      onClick: (context) => onResolved(context, item),
      text: Text(
        "Continuer",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    );
  }
}
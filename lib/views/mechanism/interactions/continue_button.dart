


import 'package:airscaper/views/common/ars_button.dart';
import 'package:flutter/material.dart';

class MechanismBackButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ARSButton(
      onClick: _onContinueButtonClicked,
      text: Text(
        "Retour",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    );
  }

  _onContinueButtonClicked(BuildContext context) {
    Navigator.of(context).pop();
  }
}
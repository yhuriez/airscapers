import 'package:airscaper/views/common/ars_button.dart';
import 'package:flutter/material.dart';

class ContinueButtonView extends StatelessWidget {
  const ContinueButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ARSButton(
        key: const Key("details_continue_button"),
        onClick: _onContinueButtonClicked,
        text: Text(
          "Continuer",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  _onContinueButtonClicked(BuildContext context) {
    Navigator.of(context).pop();
  }
}

import 'package:airscaper/domain/usecases/inventory/add_loot_use_case.dart';
import 'package:airscaper/injection.dart';
import 'package:airscaper/models/mechanism_solving.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:flutter/material.dart';

class PickButtonView extends StatelessWidget {

  AddLootUseCase get _addLootUseCase => sl();

  final MechanismSolvingPick _solving;

  const PickButtonView(this._solving, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ARSButton(
        onClick: _onContinueButtonClicked,
        text: Text(
          "Prendre",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  _onContinueButtonClicked(BuildContext context) {
    _addLootUseCase.execute(_solving.newItem);
    Navigator.of(context).pop();
  }
}

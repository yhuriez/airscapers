import 'package:airscaper/domain/usecases/inventory/add_item_use_case.dart';
import 'package:airscaper/injection.dart';
import 'package:airscaper/models/mechanism_solving.dart';
import 'package:airscaper/models/scenario_mechanism.dart';
import 'package:airscaper/views/common/ars_button.dart';
import 'package:flutter/material.dart';

class PickButtonView extends StatelessWidget {

  AddItemUseCase get _addLootUseCase => sl();

  final ScenarioMechanism _mechanism;
  final MechanismSolvingPick _solving;

  const PickButtonView(this._mechanism, this._solving, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ARSButton(
        key: const Key("details_pick_button"),
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
    _addLootUseCase.execute(_solving.newItem, _mechanism.id);
    Navigator.of(context).pop();
  }
}

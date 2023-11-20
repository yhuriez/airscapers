import 'package:airscaper/domain/usecases/mechanisms/load_mechanism_interactor.dart';
import 'package:airscaper/domain/usecases/mechanisms/mechanism_code_input_use_case.dart';
import 'package:airscaper/domain/usecases/mechanisms/mechanism_item_select_use_case.dart';
import 'package:airscaper/domain/usecases/mechanisms/resolve_mechanism_interactor.dart';
import 'package:airscaper/injection.dart';
import 'package:airscaper/models/mechanism_solving.dart';
import 'package:airscaper/models/navigation_intent.dart';
import 'package:airscaper/models/scenario_item.dart';
import 'package:airscaper/models/scenario_mechanism.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MechanismScreenState extends ChangeNotifier {
  final MechanismItemSelectUseCase _itemSelectUseCase = sl();
  final LoadMechanismInteractor _loadMechanismInteractor = sl();
  final MechanismCodeInputUseCase _codeInputUseCase = sl();
  final ResolveMechanismInteractor _resolveMechanismInteractor = sl();

  final String mechanismId;
  late ScenarioMechanism mechanism;
  NavigationIntent? nextIntent;

  MechanismScreenState(this.mechanismId) {
    refreshState(_loadMechanismInteractor.execute(mechanism.id));
  }

  refreshState(ScenarioMechanism mechanism) {
    this.mechanism = mechanism;
    notifyListeners();
  }

  onItemUsed(ScenarioItem selectedItem) {
    var solving = mechanism.solving;
    if (solving is MechanismSolvingUse) {
      final ScenarioMechanism? result =
          _itemSelectUseCase.execute(mechanism, solving, selectedItem.id);
      if (result != null) {
        refreshState(result);
      }
    }
  }

  bool onCodeInput(MechanismSolvingCode solving, String codeResult) {
    final newState = _codeInputUseCase.execute(mechanism, solving, codeResult);
    if (newState != null) {
      refreshState(newState);
      return true;
    }
    return false;
  }

  onStateResolved() {
    final newMechanism = _resolveMechanismInteractor.execute(mechanism);
    if (newMechanism != null) {
      refreshState(_loadMechanismInteractor.execute(mechanism.id));
    } else {
      throw Exception("Should not happen");
    }
  }
}

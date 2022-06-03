

import 'package:airscaper/domain/usecases/mechanism_use_cases.dart';
import 'package:airscaper/injection.dart';
import 'package:airscaper/models/navigation_intent.dart';
import 'package:airscaper/models/scenario_item.dart';
import 'package:airscaper/models/scenario_mechanism.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MechanismScreenState extends ChangeNotifier {

  final MechanismItemSelectUseCase _itemSelectUseCase = sl();
  final LoadCurrentMechanismStateUseCase _loadMechanismStateUseCase = sl();
  final MechanismFinishedUseCase _mechanismFinishedUseCase = sl();
  final MechanismCodeInputUseCase _codeInputUseCase = sl();

  final ScenarioMechanism mechanism;
  late MechanismState mechanismState;
  NavigationIntent? nextIntent;

  MechanismScreenState(this.mechanism) {
    refreshState(_loadMechanismStateUseCase.execute(mechanism));
  }

  refreshState(MechanismState givenState) {
    mechanismState = givenState;
    if(mechanismState.endTrack != null) {
      nextIntent = _mechanismFinishedUseCase.execute(mechanism, mechanismState.endTrack!);
    }
    notifyListeners();
  }

  onItemUsed(ScenarioItem selectedItem) {
    if (!acceptedIds.contains(selectedItem.id)) return null;

    final MechanismState? result = _itemSelectUseCase.execute(mechanism, selectedItem.id);
    if (result != null) {
      refreshState(result);
    }
  }

  List<int> get acceptedIds => mechanismState.transitions
      .map((it) => it.expectedItem)
      .whereType<int>()
      .toList();


  bool onCodeInput(String codeResult) {
    final newState = _codeInputUseCase.execute(mechanism, codeResult);
    if(newState != null) {
      refreshState(newState);
      return true;
    }
    return false;
  }

  onStateResolved() {
    final newState = sl<StateTransitionUseCase>().execute(mechanism, mechanismState.transitions.first);
    refreshState(newState);
  }
}
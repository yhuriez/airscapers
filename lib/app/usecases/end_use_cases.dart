
import 'package:airscaper/app/domain/scenario_repository.dart';
import 'package:airscaper/app/domain/sharedprefs/scenario_shared_prefs.dart';
import 'package:airscaper/app/views/home/bloc/inventory/inventory_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Reset all scenario local data
class EndScenarioUseCase {
  final ScenarioSharedPrefs _sharedPrefs;
  final ScenarioRepository _repository;

  EndScenarioUseCase(this._sharedPrefs, this._repository);

  Future<bool> execute(BuildContext context) async {
    await _sharedPrefs.clear();
    _repository.resetScenario();
    return true;
  }
}

class ComputeCompletionUseCase {

  final ScenarioRepository _repository;

  ComputeCompletionUseCase(this._repository);

  Future<int> execute(BuildContext context) async {
    final state = BlocProvider.of<InventoryBloc>(context).state;

    final foundElementsSize = state.resolvedItems.length;
    final allElementsSize = _repository.items.length;

    return ((foundElementsSize / allElementsSize) * 100).toInt();
  }
}

class TimeUsedUseCase {

  final ScenarioSharedPrefs _sharedPrefs;

  TimeUsedUseCase(this._sharedPrefs);

  Future<int> execute() async {
    final startDate = await _sharedPrefs.getStartDate();
    final endDate = await _sharedPrefs.getEndDate();

    final durationLeft = endDate.difference(startDate);
    return durationLeft.inSeconds;
  }
}
import 'package:airscaper/model/entities/scenario_clue.dart';
import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/views/home/bloc/inventory/inventory_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ListMap<T> on List<T> {
  List<U> mapIndexed<U>(U Function(int, T) call) {
    return this
        .asMap()
        .map((index, value) => MapEntry(index, call(index, value)))
        .values
        .toList();
  }
}

extension ScenarioItemExtension on ScenarioItem {
  List<ScenarioClue> getScenarioClues() {
    return clues.mapIndexed(
        (index, clueText) => ScenarioClue(id * 100 + index, clueText));
  }
}

extension ContextExtension on BuildContext {
  InventoryBloc get inventoryBloc => BlocProvider.of<InventoryBloc>(this);
}
import 'dart:async';

import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/repositories/scenario_repository.dart';
import 'package:airscaper/usecases/init_use_cases.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {

  final ScenarioRepository _repository = sl();

  @override
  InventoryState get initialState => InventoryState(loading: true);

  @override
  Stream<InventoryState> mapEventToState(InventoryEvent event) async* {
    try {
      if (event is InitInventoryEvent) {
        // TODO()

      } else if (event is RefreshInventoryEvent) {
        // TODO()

      } else if (event is AddItemInventoryEvent) {
        // TODO()

      } else if (event is ClearInventoryEvent) {
        // TODO()

      } else {
        throw Exception("Event not handled : $event");
      }
    } catch (exception, stack) {
      debugPrintStack(stackTrace: stack, label: exception.toString());
    }
  }
}

/// EVENT
abstract class InventoryEvent {}

class InitInventoryEvent extends InventoryEvent {}

class RefreshInventoryEvent extends InventoryEvent {}

class AddItemInventoryEvent extends InventoryEvent {}

class ClearInventoryEvent extends InventoryEvent {}

/// STATE
class InventoryState {
  final List<ScenarioItem> items;
  final bool loading;

  InventoryState({this.items, this.loading = false});
}

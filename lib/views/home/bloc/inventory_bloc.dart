import 'dart:async';

import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/model/inventory_local_source.dart';
import 'package:airscaper/repositories/scenario_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {

  final ScenarioRepository _repository = sl();
  final InventoryLocalSource _localSource = sl();

  @override
  InventoryState get initialState => InventoryState(loading: true);

  @override
  Stream<InventoryState> mapEventToState(InventoryEvent event) async* {
    try {
      if (event is InitInventoryEvent) {
        final items = await _localSource.loadUnusedItems();
        final scenarioItems= _repository.getItems(items);
        yield InventoryState(items: scenarioItems);


      } else if (event is RemoveItemInventoryEvent) {
        await _localSource.updateItemUsed(event.itemId);

        var newItems = state.items ?? [];
        newItems.removeWhere((it) => it.id == event.itemId);
        yield InventoryState(items: newItems);


      } else if (event is AddItemInventoryEvent) {
        final id = await _localSource.insertItem(event.itemId);
        final scenarioItem = _repository.getItem(id);

        final newItems = (state.items ?? []) + [scenarioItem];
        yield InventoryState(items: newItems);


      } else if (event is ClearInventoryEvent) {
        await _localSource.clear();
        yield InventoryState(items: []);

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

class AddItemInventoryEvent extends InventoryEvent {
  final int itemId;

  AddItemInventoryEvent(this.itemId);
}

class RemoveItemInventoryEvent extends InventoryEvent {
  final int itemId;

  RemoveItemInventoryEvent(this.itemId);
}

class ClearInventoryEvent extends InventoryEvent {}


/// STATE
class InventoryState {
  final List<ScenarioItem> items;
  final bool loading;

  InventoryState({this.items, this.loading = false});
}

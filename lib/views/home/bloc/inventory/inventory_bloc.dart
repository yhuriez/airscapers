import 'dart:async';

import 'package:airscaper/repositories/scenario_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../injection.dart';
import 'inventory_events.dart';
import 'inventory_state.dart';

class InventoryBloc extends HydratedBloc<InventoryEvent, InventoryState> {

  InventoryBloc() : super(InventoryState(loading: true));

  ScenarioRepository get _repository => sl();

  @override
  Stream<InventoryState> mapEventToState(InventoryEvent event) async* {
    try {
      // INIT ITEM
      if (event is InitInventoryEvent) {
        final items = state.unusedItems;
//        items.sort((first, second) => first.creationDate.compareTo(second.creationDate));
//        final scenarioItems = _repository.getItems(items);
        yield InventoryState(items: items);

        // REMOVE ITEM
      } else if (event is RemoveItemsInventoryEvent) {
        Set<int> resolvedItems = state.resolvedItems ?? {};
        resolvedItems.addAll(event.itemIds);
        yield state.clone(resolvedItems: resolvedItems);

        // ADD ITEM
      } else if (event is AddItemInventoryEvent) {
        final scenarioItem = _repository.getItem(event.itemId);

        final newItems = (state.items ?? []) + [scenarioItem];
        yield state.clone(
            items: newItems,
            newItem: scenarioItem.id,
            hasEnded: scenarioItem.endTrack);

        // SELECT ITEM
      } else if (event is SelectItemInventoryEvent) {
        if (state.selectedItem == event.itemId) {
          // -1 instead of null to make clone works (null values are replaced
          // by current state value)
          yield state.clone(selectedItem: -1);
        } else {
          yield state.clone(selectedItem: event.itemId);
        }

        // DESELECT ITEM
      } else if (event is DeselectItemInventoryEvent) {
        yield state.clone(selectedItem: -1);


        // RESOLVED ITEM
      } else if (event is ResolveItemInventoryEvent) {
        Set<int> newResolvedItems = (state.resolvedItems ?? {});
        newResolvedItems.add(event.itemId);
        yield state.clone(resolvedItems: newResolvedItems);


        // CLEAR INVENTORY
      } else if (event is ClearInventoryEvent) {
        yield InventoryState(items: [], resolvedItems: {});

        // ELSE
      } else {
        throw Exception("Event not handled : $event");
      }
    } catch (exception, stack) {
      debugPrintStack(stackTrace: stack, label: exception.toString());
    }
  }

  @override
  InventoryState fromJson(Map<String, dynamic> json) {
    return InventoryState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(InventoryState state) {
    if(!state.loading) {
      return state.toJson();
    }
    return null;
  }
}

import 'dart:async';

import 'package:airscaper/app/domain/scenario_repository.dart';
import 'package:flutter/cupertino.dart';
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
        yield InventoryState();


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


        // RESOLVE ITEM
      } else if (event is ResolveItemInventoryEvent) {
        final removedItems = event.item.transition?.removedItems ?? [];

        // Mark resolved items
        final newResolvedItems = (state.resolvedItems.toSet() ?? {});
        newResolvedItems.add(event.item.id);
        newResolvedItems.addAll(removedItems);

        // Remove used items from items
        final newItems = state.items ?? [];
        newItems.removeWhere((item) => removedItems.contains(item.id));

        // If next step is last step (no more transition) we add it to resolved items
        final nextItemId = event.item.transition?.transitionTo;
        if(nextItemId != null) {
          final nextItem = _repository.getItem(nextItemId);
          if(nextItem != null && nextItem.transition == null) {
            newResolvedItems.add(nextItemId);
          }
        }

        yield state.clone(resolvedItems: newResolvedItems, items: newItems);


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

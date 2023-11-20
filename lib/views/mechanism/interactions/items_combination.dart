import 'package:airscaper/models/mechanism_solving.dart';
import 'package:airscaper/models/scenario_item.dart';
import 'package:airscaper/views/common/ars_paginated_grid.dart';
import 'package:airscaper/views/mechanism/mechanism_screen_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const GRID_HEIGHT = 60.0;
const ITEM_SIZE = 50.0;

class MechanismItemsCombination extends StatefulWidget {
  final MechanismSolvingCombine _solving;

  MechanismItemsCombination(this._solving);

  @override
  _MechanismItemsCombinationState createState() => _MechanismItemsCombinationState();
}

class _MechanismItemsCombinationState extends State<MechanismItemsCombination> {
  late List<String> expectedItemList;
  Map<int, ScenarioItem> selectedItems = {};

  @override
  void initState() {
    super.initState();

    expectedItemList = widget._solving.expectedItemList;

    if (expectedItemList.isEmpty) {
      throw Exception("Transition with expectedItemList is expected at this point");
    }
    expectedItemList.sort();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: GRID_HEIGHT,
      child: Row(
        children: createSlots(),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }

  List<Widget> createSlots() {
    List<Widget> result = [];

    for (var index = 0; index < expectedItemList.length; index++) {
      final selectedItem = selectedItems[index];

      final widget = (selectedItem != null)
          ? ARSGridImageItem(
              item: selectedItem,
              itemSize: ITEM_SIZE,
              draggable: false,
              onItemClicked: onItemClicked)
          : ARSGridEmptyItem(
              onAcceptedData: (context, data) => onItemDropped(context, index, data));

      result.add(widget);
    }

    return result;
  }

  onItemClicked(BuildContext context, ScenarioItem item, bool selected) {
    // When clicked, delete corresponding item from list
    final newSelectedItems = Map<int, ScenarioItem>.from(selectedItems);
    newSelectedItems.removeWhere((elem, si) => si.id == item.id);

    doUpdateState(newSelectedItems);
  }

  onItemDropped(BuildContext context, int index, ScenarioItem item) {
    final newSelectedItems = Map<int, ScenarioItem>.from(selectedItems);
    newSelectedItems[index] = item;

    doUpdateState(newSelectedItems);
  }

  doUpdateState(Map<int, ScenarioItem> newSelectedItems) async {
    final itemSet = newSelectedItems.values.map((elem) => elem.id).toSet().toList();
    itemSet.sort();

    print("Item Set is : $itemSet");

    // If items selected are right, we do execute state transition
    if (listEquals(itemSet, expectedItemList)) {
      final state = context.read<MechanismScreenState>();
      state.onStateResolved();

      // Else we update current widget state
    } else {
      setState(() {
        selectedItems = newSelectedItems;
      });
    }
  }
}

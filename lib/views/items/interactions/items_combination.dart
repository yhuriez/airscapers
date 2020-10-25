import 'package:airscaper/model/entities/scenario_item.dart';
import 'package:airscaper/views/common/ars_paginated_grid.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const GRID_HEIGHT = 60.0;
const ITEM_SIZE = 50.0;

class ItemCombination extends StatefulWidget {
  final ScenarioItem item;
  final Function(BuildContext, ScenarioItem) onResolved;

  const ItemCombination(this.item, this.onResolved, {Key key})
      : super(key: key);

  @override
  _ItemCombinationState createState() =>
      _ItemCombinationState();
}

class _ItemCombinationState extends State<ItemCombination> {
  List<int> expectedItemList;
  Map<int, ScenarioItem> selectedItems = {};

  @override
  void initState() {
    super.initState();
    expectedItemList = widget.item.transition.expectedItemList ?? [];

    if (expectedItemList.isEmpty) {
      throw Exception(
          "Transition with expectedItemList is expected at this point");
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
              onAcceptedData: (context, data) =>
                  onItemDropped(context, index, data));

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
    final itemSet =
        newSelectedItems.values.map((elem) => elem.id).toSet().toList();
    itemSet.sort();

    print("Item Set is : $itemSet");

    // If items selected are right, we do resolve item
    if (listEquals(itemSet, expectedItemList)) {
      widget.onResolved(context, widget.item);

      // Else we update current widget state
    } else {
      setState(() {
        selectedItems = newSelectedItems;
      });
    }
  }
}



import 'dart:async';

import 'package:airscaper/domain/repositories/scenario_repository.dart';
import 'package:airscaper/domain/storage/inventory_local_source.dart';
import 'package:airscaper/injection.dart';
import 'package:airscaper/models/scenario_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class InventoryState extends ChangeNotifier {

  ScenarioRepository get _repository => sl();
  InventoryLocalSource get _localSource => sl();

  List<ScenarioItem> _items = [];
  bool _loading = true;
  int? _selectedItem;
  int? _newItem;

  StreamSubscription? _subscription;

  List<ScenarioItem> get items => _items;

  bool get loading => _loading;

  ScenarioItem? get selectedItem => items.firstWhereOrNull((element) => element.id == _selectedItem);

  ScenarioItem? get newItem => items.firstWhereOrNull((element) => element.id == _newItem);

  InventoryState() {
    init();
  }

  init() {
    _subscription = _localSource.watchItems().listen((_) {
      _updateItemList();
    });
    _updateItemList();
  }

  _updateItemList() {
    final inventoryItems = _localSource.loadUnusedItems();
    inventoryItems.sort((first, second) => first.creationDate.compareTo(second.creationDate));
    _items = _repository.getItems(inventoryItems);
        // .where((element) => element.isPickedUp)
        // .toList();
    notifyListeners();
  }

  addItem(int itemId) {
    _localSource.insertItem(itemId, true);
  }

  removeItem(List<int> itemIds) {
    itemIds.forEach((itemId) => _localSource.updateItemUsed(itemId));
  }

  selectItem(int itemId) {
    if (_selectedItem == itemId) {
      _selectedItem = null;

    } else {
      _selectedItem = itemId;
    }
    notifyListeners();
  }


  unselectItem(int itemId) {
    _selectedItem = null;
    notifyListeners();
  }


  clear() {
    _localSource.clear();
    _items = [];
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }
}
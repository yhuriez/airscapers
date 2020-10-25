

import 'package:airscaper/model/entities/scenario_item.dart';

abstract class InventoryEvent {}

class InitInventoryEvent extends InventoryEvent {}

class AddItemInventoryEvent extends InventoryEvent {
  final int itemId;

  AddItemInventoryEvent(this.itemId);
}

class SelectItemInventoryEvent extends InventoryEvent {
  final int itemId;

  SelectItemInventoryEvent(this.itemId);
}

class ResolveItemInventoryEvent extends InventoryEvent {
  final ScenarioItem item;

  ResolveItemInventoryEvent(this.item);
}


class DeselectItemInventoryEvent extends InventoryEvent {}
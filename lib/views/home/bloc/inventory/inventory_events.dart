

abstract class InventoryEvent {}

class InitInventoryEvent extends InventoryEvent {}

class AddItemInventoryEvent extends InventoryEvent {
  final int itemId;

  AddItemInventoryEvent(this.itemId);
}

class RemoveItemsInventoryEvent extends InventoryEvent {
  final List<int> itemIds;

  RemoveItemsInventoryEvent(this.itemIds);
}

class SelectItemInventoryEvent extends InventoryEvent {
  final int itemId;

  SelectItemInventoryEvent(this.itemId);
}

class ResolveItemInventoryEvent extends InventoryEvent {
  final int itemId;

  ResolveItemInventoryEvent(this.itemId);
}



class DeselectItemInventoryEvent extends InventoryEvent {}

class ClearInventoryEvent extends InventoryEvent {}
class ScenarioTransition {
  int expectedItem;
  List<int> expectedItemList;
  List<int> expectedTracks;
  List<String> expectedCodes;
  int transitionTo;
  List<int> removedItems;

  ScenarioTransition({this.expectedItem, this.expectedItemList, this.expectedTracks, this.expectedCodes, this.transitionTo, this.removedItems});

  ScenarioTransition.map(dynamic obj) {
    expectedItem = obj["expectedItem"];
    expectedItemList = obj["expectedItemList"].cast<int>();
    expectedTracks = obj["expectedTracks"].cast<int>();
    expectedCodes = obj["expectedCodes"].cast<String>();
    transitionTo = obj["transitionTo"];
    removedItems = obj["removedItems"].cast<int>();
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["expectedItem"] = expectedItem;
    map["expectedItemList"] = expectedItemList;
    map["expectedTracks"] = expectedTracks;
    map["expectedCodes"] = expectedCodes;
    map["transitionTo"] = transitionTo;
    map["removedItems"] = removedItems;
    return map;
  }

}